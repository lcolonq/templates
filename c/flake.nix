{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          foo = pkgs.pkgsMusl.stdenv.mkDerivation {
            pname = "foo";
            version = "git";
            src = ./.;
            hardeningDisable = ["all"];
            installPhase = ''
              make prefix=$out install
            '';
          };
        in {
          packages = {
            inherit foo;
            default = foo;
          };
          devShells.default = pkgs.mkShell {
            hardeningDisable = ["all"];
            buildInputs = [
              pkgs.musl
              pkgs.valgrind
            ];
          };
        }
      );
}
