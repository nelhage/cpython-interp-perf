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
  gh116072 = llvmPackages_19.override {
    monorepoSrc = fetchFromGitHub {
      owner = "llvm";
      repo = "llvm-project";
      rev = "0d0190815d8f273e9d87c29b4779b81412b31e91";
      hash = "sha256-Y7XltDeaaEz26zMQZL6curJx9GoN5zPXrTJd0RT8teE=";
    };
  };
}
