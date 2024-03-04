{
  inputs = {};

  outputs = {
    templates.default = {
      description = "LCOLONQ web project - Haskell + Purescript";
      path = "${./web-haskell-purescript}";
    };
  };
}
