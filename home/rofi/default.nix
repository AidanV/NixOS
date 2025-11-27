{ pkgs, ... }:
let
  themePath = ./config.rasi;
in
{

  programs.rofi = {
    package = pkgs.rofi;
    enable = true;
    plugins = [ pkgs.rofi-emoji ];
    theme = "${themePath}";
  };
}
