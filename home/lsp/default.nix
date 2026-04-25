{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    typescript-language-server
  ];
}
