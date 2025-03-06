from dataclasses import dataclass, field
from elftools.elf.elffile import ELFFile
from elftools.elf.sections import SymbolTableSection, Symbol
from elftools.elf.relocation import RelocationSection, Relocation
from elftools.dwarf.die import DIE
from elftools.dwarf.dwarfinfo import DWARFInfo
from pathlib import Path
import capstone
import fnmatch
from capstone import x86_const
import io
from py314_opcode_metadata import opmap
import argparse

@dataclass
class Context:
    fh: io.IOBase
    elf: ELFFile
    symtab: SymbolTableSection
    dwarf: DWARFInfo
    md: capstone.Cs

    bbs: "dict[int, BB]" = field(default_factory=dict)


@dataclass
class SymbolRef:
    sym: Symbol

    @property
    def name(self) -> str:
        return self.sym.name

    @property
    def shndx(self) -> int:
        return self.sym.entry.st_shndx

    @property
    def size(self) -> int:
        return self.sym.entry.st_size

    @property
    def value(self) -> int:
        return self.sym.entry.st_value

    def section(self, ctx):
        return ctx.elf.get_section(self.shndx)

    def data(self, ctx) -> bytes:
        section = self.section(ctx)
        offset = self.sym.entry.st_value - section.header.sh_addr
        return section.data()[offset : offset + self.size]

@dataclass
class BB:
    sym: SymbolRef

    addr: int
    size: int
    tail: capstone.CsInsn
    fallthrough: int | None
    succ: int | None

    def insns(self, ctx):
        text = self.sym.data(ctx)
        off = self.addr - self.sym.value

        return ctx.md.disasm(text[off:off+self.size], self.addr)


def open_interpreter(path: Path) -> Context:
    fh = path.open('rb')
    elf = ELFFile(fh)
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    md.syntax = capstone.CS_OPT_SYNTAX_ATT
    md.detail = True
    return Context(
        fh=fh,
        elf=elf,
        symtab=elf.get_section_by_name(".symtab"),
        dwarf=elf.get_dwarf_info(),
        md=md,
    )

def find_symbol(ctx: Context, name: str) -> SymbolRef:
    (sym,) = ctx.symtab.get_symbol_by_name(name)
    return SymbolRef(sym)

def glob_symbol(ctx: Context, pat: str) -> list[SymbolRef]:
    return [
        SymbolRef(sym)
        for sym in ctx.symtab.iter_symbols()
        if fnmatch.fnmatch(sym.name, pat)
    ]

def reloc_at(ctx: Context, sym: SymbolRef, offset: int) -> None | tuple[SymbolRef, Relocation]:
    target = sym.value + offset

    for section in ctx.elf.iter_sections():
        if not isinstance(section, RelocationSection):
            continue
        # print(f"relocations {section.name=} sh_info={section.header.sh_info} sym.shndx={sym.shndx}")
        if section.header.sh_info != sym.shndx and (section.name != ".rela.dyn"):
            continue

        for reloc in section.iter_relocations():
            # print(f"try reloc r_offset={reloc['r_offset']} target={sym.value}+{offset}")
            if reloc["r_offset"] == target:
                symtab = ctx.elf.get_section(section.header.sh_link)
                symbol = symtab.get_symbol(reloc['r_info_sym'])
                return (SymbolRef(symbol), reloc)
    return None


def get_func_die(ctx: Context, name: bytes) -> DIE:
    for cu in ctx.dwarf.iter_CUs():
        for die in cu.get_top_DIE().iter_children():
            if die.tag != "DW_TAG_subprogram":
                continue
            if "DW_AT_name" not in die.attributes:
                continue
            if die.attributes["DW_AT_name"].value == name:
                return die

def func_labels(ctx: Context, func: str) -> dict[str, DIE]:
    return {
        d.attributes["DW_AT_name"].value.decode(): d
        for d in get_func_die(ctx, func.encode()).iter_children()
        if d.tag == "DW_TAG_label" and "DW_AT_name" in d.attributes
    }

def dissassemble_one_bb(ctx: Context, sym: SymbolRef, va: int) -> BB:
    text = sym.data(ctx)
    off = va - sym.value

    dis = ctx.md.disasm(text[off:], va)
    for insn in dis:
        if (insn.group(x86_const.X86_GRP_JUMP) or insn.group(x86_const.X86_GRP_RET)) and not insn.group(x86_const.X86_GRP_CALL):
            break

    match insn.mnemonic:
        case 'ret'|'retq':
            fallthrough = False
            succ = None
        case 'call'|'callq':
            fallthrough = False
            succ = None

        case 'jmp'|'jmpq':
            fallthrough = False
            if insn.group(x86_const.X86_GRP_BRANCH_RELATIVE) and insn.operands[0].type == x86_const.X86_OP_IMM:
                succ = insn.operands[0].imm
            else:
                succ = None
        case 'je'|'jne'|'jg'|'jge'|'jl'|'jle'|'js'|'jns'|'ja'|'jb'|'jae'|'jbe':
            fallthrough = True
            succ = insn.operands[0].imm
        case _:
            raise ValueError(f"don't understand: {insn}")

    nextva = insn.address+len(insn.bytes)

    return BB(
        sym=sym,
        addr=va,
        size=nextva - va,
        tail=insn,
        fallthrough=nextva if fallthrough else None,
        succ=succ
    )

def disassemble_entrypoint(ctx: Context, sym: SymbolRef, va: int) -> BB:
    queue = [va]
    while queue:
        addr = queue.pop()
        if addr in ctx.bbs:
            continue
        # print(f"{addr:x}...")
        bb = dissassemble_one_bb(ctx, sym, addr)
        ctx.bbs[addr] = bb
        if bb.fallthrough:
            queue.append(bb.fallthrough)
        if bb.succ:
            queue.append(bb.succ)

    return ctx.bbs[va]

def walk_bbs(ctx, va: int) -> list[BB]:
    bbs = set()
    queue = [va]
    while queue:
        addr = queue.pop()
        if addr in bbs:
            continue
        bbs.add(addr)
        bb = ctx.bbs[addr]
        if bb.fallthrough:
            queue.append(bb.fallthrough)
        if bb.succ:
            queue.append(bb.succ)

    return [ctx.bbs[a] for a in sorted(bbs)]

def pp_cfg(ctx, entrypoint, labels={}):
    bblist = walk_bbs(ctx, entrypoint)
    for bb in bblist:
        if bb.addr in labels:
            name = labels[bb.addr]
            print(f"{name}:")
        for insn in bb.insns(ctx):
            print(f"0x{insn.address:06x}:    {insn.mnemonic:<8s} {insn.op_str}")
        print()

OPCODE_TARGETS = "_PyEval_EvalFrameDefault.opcode_targets"

def get_opcode_entrypoint(ctx, opcode: str) -> tuple[SymbolRef, int]:
    assert opcode in opmap, f"Unknown opcode: {opcode}"
    opnum = opmap[opcode]

    opcode_targets = ctx.symtab.get_symbol_by_name(OPCODE_TARGETS)
    if opcode_targets is None:
        sym, = glob_symbol(ctx, f"_TAIL_CALL_{opcode}.*")
        return (sym, sym.value)

    assert len(opcode_targets) == 1
    targets = SymbolRef(opcode_targets[0])
    eval_frame = find_symbol(ctx, "_PyEval_EvalFrameDefault")
    rsym, reloc = reloc_at(ctx, targets, 8*opnum)

    assert rsym.shndx == eval_frame.shndx or rsym.shndx == 'SHN_UNDEF'
    va = rsym.value + reloc.entry.r_addend

    assert va >= eval_frame.value and va < eval_frame.value + eval_frame.size

    return (eval_frame, va)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('python', metavar='PATH')
    parser.add_argument('opcode', metavar='OPCODE', action='append')

    args = parser.parse_args()

    ctx = open_interpreter(Path(args.python))

    for opcode in args.opcode:
        sym, va = get_opcode_entrypoint(ctx, opcode)

        print(f";; {opcode}: {sym.name}+{va-sym.value:x}")
        disassemble_entrypoint(ctx, sym, va)
        pp_cfg(ctx, va, {va: f"OPCODE_{opcode}"})
        print()

if __name__ == '__main__':
    main()
