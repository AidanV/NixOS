{ pkgs, ... }:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
    ./git
  ];
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";


  home.packages = with pkgs; [
    firefox-wayland
    neofetch
    # obsidian
    bitwarden
    discord
    gnomeExtensions.blur-my-shell
    gnome.gnome-tweaks
    gnome.gnome-boxes
    bibata-cursors
    papirus-icon-theme
    vscode
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
