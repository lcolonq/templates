{
  inputs = {
    teleia.url = "github:lcolonq/teleia";
    nixpkgs.follows = "teleia/nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      game = inputs.teleia.native.build ./. "game";
    in {
      packages.${system} = {
        inherit game;
      };
      devShells.${system}.default = inputs.teleia.shell.overrideAttrs (final: prev: {
        buildInputs = prev.buildInputs;
      });
    };
}
