{ pkgs, ... }:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
    ./git
    ./sway
    ./swaylock
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
    beeper
  ];

  home.pointerCursor = {
    name = "Bibata";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "Bibata";
    };
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
