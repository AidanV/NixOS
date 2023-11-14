{config, ...}:{
  imports = [ ./kitty.nix ./tmux.nix ];
  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
