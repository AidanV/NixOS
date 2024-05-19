{ pkgs, inputs, ... }:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
    # ./i3
    ./rofi
    ./eww
    ./hyprland
    ./waybar
    # ./sway
    ./git
    # ./swaylock
    ./nixvim
    inputs.nixvim.homeManagerModules.nixvim
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
    swww
    eww
    pavucontrol
    # pamixer
    swaylock-effects # swayidle wlogout swaybg swaynotificationcenter
    hyprland-protocols
    libnotify
    gnome.gnome-tweaks
    gnome.gnome-boxes
    gnome.gnome-calculator
    pika-backup
    bibata-cursors
    papirus-icon-theme
    vscode
    emacs
    beeper
  	wayshot slurp grim
    zoom-us
    zathura
    calc
    htop-vim
    pamixer
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
