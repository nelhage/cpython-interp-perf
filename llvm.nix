{
  llvmPackages_20,
  llvmPackages_19,
  overrideCC,
  stdenv,
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
      libllvm = prev.libllvm.overrideAttrs {
        patches = prev.libllvm.patches ++ [
          ./patches/0001-TailDup-Allow-large-number-of-predecessors-successor.patch
          ./patches/0002-Add-a-computed-goto-test.patch
          ./patches/0003-TailDuplicator-Do-not-restrict-the-computed-gotos.patch
        ];
      };

      stdenv = overrideCC stdenv final.clang;
    }
  );
}
