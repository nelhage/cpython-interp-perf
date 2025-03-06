{
  fetchFromGitHub,
  callPackage,
  runCommand,
  lib,
  python313,
  openssl,
  llvmPackages_19,
  llvmPackages_20,
  llvmPackages_18,
  llvm_gh114990,

  stdenv,

  # Flag to make config compatible with an older version of this git
  # repo, so I can reproduce old resuls more easily. The changes
  # between this state and the current `main` branch were necessary
  # for Darwin support to work properly.
  useCompatConfig ? false,
  ...
}:

assert lib.assertMsg (
  useCompatConfig -> !stdenv.isDarwin
) "Compat config is not compatible with Darwin.";
let
  src = fetchFromGitHub {
    owner = "python";
    repo = "cpython";
    rev = "9211b3dabeacb92713ac3f5f0fa43bc7cf69afd8";
    hash = "sha256-yKLUIgs/693+8xVB16zGl4O4UU/gQlmbW9N5UDUDksA=";
  };

  buildPython =
    { stdenv, python3 }:
    stdenv.mkDerivation {
      pname = "python";
      version = "3.14";
      src = src;
      buildInputs = python3.buildInputs;
      nativeBuildInputs = python3.nativeBuildInputs;
      enableParallelBuilding = true;
      configureFlags =
        if useCompatConfig then
          [ ]
        else
          [
            "--with-openssl=${openssl.dev}"
          ];
    };

  notLLVM = l: builtins.filter (p: (p.pname or "") != "llvm") l;

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
        final: prev:
        if useCompatConfig then
          {
            buildInputs = prev.buildInputs ++ [ llvm.bintools ];
          }
        else
          {
            nativeBuildInputs = [ llvm.bintools ] ++ (notLLVM prev.nativeBuildInputs or [ ]);
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

    clang19_gh114990 = withLLVM llvm_gh114990 optLTO;

    clang19asmvolatile = clang19.overrideAttrs (
      final: prev: {
        patches = (prev.patches or [ ]) ++ [
          ./patches/0001-Prevent-the-compiler-from-merging-computed-goto-disp.patch
        ];
      }
    );

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
