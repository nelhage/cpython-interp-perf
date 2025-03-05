{
  llvmPackages_20,
  llvmPackages_19,
  fetchFromGitHub,
  lib,
  ...
}:
let
  inherit (lib) recurseIntoAttrs;
in
{
  gh114990 = llvmPackages_19.tools.extend (
    final: prev: {
      llvm = prev.llvm.overrideAttrs {
        patches = prev.llvm.patches ++ [
          ./patches/0001-TailDup-Allow-large-number-of-predecessors-successor.patch
          ./patches/0002-Add-a-computed-goto-test.patch
          ./patches/0003-TailDuplicator-Do-not-restrict-the-computed-gotos.patch
        ];
      };
    }
  );
}
