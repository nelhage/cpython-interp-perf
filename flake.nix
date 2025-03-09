{
  description = "Playing with CPython interpreters";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
      ];
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.uv
            ];

            shellHook = ''
              export UV_PYTHON=${pkgs.python313}/bin/python3
            '';
          };
        }
      );

      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        rec {
          llvm = pkgs.callPackage ./llvm.nix { };
          python = pkgs.callPackage ./python.nix {
            llvm_gh114990 = llvm.gh114990;
            useCompatConfig = !pkgs.stdenv.isDarwin;
          };
        }
      );
    };
}
