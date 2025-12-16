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
}
