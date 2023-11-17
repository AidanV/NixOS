{...}:{
  imports = [ 
    ./kitty 
    ./tmux 
    ./starship
    ./zsh
  ];
  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
