{ ... }:
{
  imports = [
    ./ghostty
    ./kitty
    ./tmux
    ./starship
    ./zsh
  ];
  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
