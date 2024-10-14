{
  inputs = {};

  outputs = { self, ...}@inputs:
    let
    in {
      templates = {
        web-haskell-purescript = {
          description = "LCOLONQ web project - Haskell + Purescript";
          path = "${./web-haskell-purescript}";
        };
        game-teleia = {
          description = "LCOLONQ game project - Rust";
          path = "${./game-teleia}";
        };
      };
    };
}
