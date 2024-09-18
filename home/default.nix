{ pkgs, inputs, ... }:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
    ./rofi
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
    pavucontrol
    libnotify
    gnome-calculator
    pika-backup
    bibata-cursors
    papirus-icon-theme
    vscode
    zed-editor
    emacs
    beeper
    # wayshot
    # slurp
    # grim
    grimblast
    zoom-us
    zathura
    calc
    htop-vim
    pamixer
    rofi-bluetooth
    rofi-power-menu
    gparted
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
