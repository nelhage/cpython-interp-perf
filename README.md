# Performance testing for CPython and clang

This repository contains [nix][nix] configuration to build CPython
against various versions of GCC and clang/LLVM, using various
configuration options. I used this to explore the performance of [the
new tail-call interpreter][tailcall] and to explore the impact of [an
LLVM regression I found][regression] starting with LLVM 19.

[nix]: https://nixos.org/
[tailcall]: https://github.com/python/cpython/pull/128718
