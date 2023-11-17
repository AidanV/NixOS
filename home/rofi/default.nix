{ ... }:
let 
  themePath = ./squared-nord.rasi;

in {

  programs.rofi = {
    enable = true;
    theme = "${themePath}";
  };
}
