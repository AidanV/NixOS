{
  pkgs,
  inputs,
  weekly-pkgs,
  ...
}:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
    ./rofi
    ./git
    ./caelestia
    ./hyprland
    # ./nixvim
    # inputs.nixvim.homeModules.nixvim
  ];
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";

  home.packages = with pkgs; [
    claude-code
    ghostty
    firefox
    neofetch
    neovim
    # bitwarden
    vesktop
    swww
    pavucontrol
    libnotify
    pika-backup
    bibata-cursors
    papirus-icon-theme
    vscode
    weekly-pkgs.zed-editor.fhs
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
    quickemu
    gparted
    gnome-tweaks
    gnome-calculator
    openocd
    openconnect
    docker
    docker-compose
    nautilus
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };


  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "bibata-modern-classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
