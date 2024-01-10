{ pkgs, ... }:
let 
  themePath = ./nord-oneline.rasi;

in {

  programs.rofi = {
    package = pkgs.rofi-wayland;
    enable = true;
    plugins = [pkgs.rofi-emoji];
    theme = "${themePath}";
  };
}
