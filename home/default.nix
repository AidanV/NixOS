{ pkgs, ... }:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
    ./git
    ./sway
  ];
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";


  home.packages = with pkgs; [
    firefox-wayland
    opera
    neofetch
    # obsidian
    bitwarden
    discord
    # gnomeExtensions.blur-my-shell
    gnome.gnome-tweaks
    gnome.gnome-boxes
    gnome.gnome-calculator
    pika-backup
    bibata-cursors
    papirus-icon-theme
    vscode
    emacs
  ];

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
