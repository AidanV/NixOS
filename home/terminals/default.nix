{config, ...}:{
  imports = [ ./kitty.nix ];
  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
