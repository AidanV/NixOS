{ pkgs, ... }:
let 
  themePath = ./config.rasi;

in {

  programs.rofi = {
    package = pkgs.rofi-wayland;
    enable = true;
    plugins = [pkgs.rofi-emoji];
    theme = "${themePath}";
  };
}
