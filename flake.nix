{
  inputs = {};

  outputs = { self, ...}@inputs:
    let
    in {
      templates.default = {
        description = "LCOLONQ web project - Haskell + Purescript";
        path = "${./web-haskell-purescript}";
      };
    };
}
