{
  config,
  pkgs,
  lib,
  ...
}:

let
  caelestiaConfigDir = ./.;
in
{
  home.packages = with pkgs; [
    caelestia-shell
    caelestia-cli
  ];
  home.file.".config/caelestia/shell.json" = {
    source = ./shell.json;
    recursive = true;
  };
}
