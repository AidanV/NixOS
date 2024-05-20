{ pkgs, inputs, ... }:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
    ./rofi
    ./eww
    ./hyprland
    ./git
    ./nixvim
    inputs.nixvim.homeManagerModules.nixvim
  ];
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";

  home.packages = with pkgs; [
    firefox-wayland
    opera
    neofetch
    bitwarden
    discord
    swww
    eww
    pavucontrol
    swaylock-effects
    swaynotificationcenter # swayidle wlogout swaybg
    hyprland-protocols
    libnotify
    gnome.gnome-boxes
    gnome.gnome-calculator
    pika-backup
    bibata-cursors
    papirus-icon-theme
    vscode
    emacs
    beeper
    wayshot
    slurp
    grim
    zoom-us
    zathura
    calc
    htop-vim
    pamixer
  ];

  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
