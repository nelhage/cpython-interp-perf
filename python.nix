{
  fetchFromGitHub,
  callPackage,
  runCommand,
  lib,
  python313,
  llvmPackages_19,
  llvmPackages_20,
  llvmPackages_18,
  ...
}:
let
  src = fetchFromGitHub {
    owner = "python";
    repo = "cpython";
    rev = "9211b3dabeacb92713ac3f5f0fa43bc7cf69afd8";
    hash = "sha256-yKLUIgs/693+8xVB16zGl4O4UU/gQlmbW9N5UDUDksA=";
  };

  buildPython =
    { stdenv, python3 }:
    let
      deps = python3.buildInputs ++ python3.nativeBuildInputs;
    in
    stdenv.mkDerivation {
      pname = "python";
      version = "3.14";
      src = src;
      buildInputs = python3.buildInputs;
      nativeBuildInputs = python3.nativeBuildInputs;
      enableParallelBuilding = true;
    };

  withOpt =
    opt: p:
    p.overrideAttrs (
      final: prev: {
        configureFlags = (prev.configureFlags or [ ]) ++ [ opt ];
      }
    );
  withTC = withOpt "--with-tail-call-interp";
  withOptimizations = withOpt "--enable-optimizations";
  withLTO = withOpt "--with-lto";
  withLLVM = (
    llvm: p:
    (p.override ({
      stdenv = llvm.stdenv;
    })).overrideAttrs
      (
        final: prev: {
          buildInputs = prev.buildInputs ++ [ llvm.bintools ];
        }
      )
  );
  noZeroCallUsed = (
    p:
    p.overrideAttrs {
      hardeningDisable = [ "zerocallusedregs" ];
    }
  );
  withTailDup = (
    p:
    p.overrideAttrs (
      final: prev: {
        preConfigure = ''
          configureFlagsArray+=(
            "OPT=-g -O3 -Wall -mllvm -tail-dup-pred-size=5000"
            "LDFLAGS=-fuse-ld=lld -Wl,-mllvm -Wl,-tail-dup-pred-size=5000"
          )
        '';
      }
    )
  );

  builds = rec {
    inherit src;

    base = callPackage buildPython { python3 = python313; };
    optimized = withOptimizations base;
    optLTO = withLTO optimized;

    clang18 = withLLVM llvmPackages_18 optLTO;
    clang19 = withLLVM llvmPackages_19 optLTO;
    clang20 = withLLVM llvmPackages_20 optLTO;

    clang18nozero = noZeroCallUsed clang18;

    clang19taildup = withTailDup clang19;
    clang20taildup = withTailDup clang20;

    clang19TC = withTC clang19;
    clang20TC = withTC clang20;

    clang19TCnozero = noZeroCallUsed clang19TC;
    clang20TCnozero = noZeroCallUsed clang20TC;

    clang19TCskipzero = clang19TC.overrideAttrs {
      patches = [
        ./patches/skip-zero.patch
      ];
    };
  };
in
builds
// {
  all =
    let
      inherit (lib.attrsets) mapAttrsToList;
      inherit (lib.strings) concatStringsSep;
    in
    runCommand "python-builds" { } (
      ''
        mkdir -p $out
      ''
      + concatStringsSep "\n" (mapAttrsToList (k: v: "ln -nsf ${v} $out/${k}") builds)
    );
}
