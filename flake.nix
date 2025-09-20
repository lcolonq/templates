{
  inputs = {};

  outputs = { self, ...}@inputs:
    let
    in {
      templates = {
        shell = {
          description = "LCOLONQ development shell";
          path = "${./shell}";
        };
        web-haskell-purescript = {
          description = "LCOLONQ web project - Haskell + Purescript";
          path = "${./web-haskell-purescript}";
        };
        game-teleia = {
          description = "LCOLONQ game project - Rust";
          path = "${./game-teleia}";
        };
        c = {
          description = "LCOLONQ project - C";
          path = "${./c}";
        };
      };
    };
}
