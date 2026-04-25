{
  pkgs,
  inputs,
  zed,
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
    # bitwarden
    # grim
    # slurp
    # wayshot
    beeper
    bibata-cursors
    calc
    claude-code
    codex-acp
    codex
    docker
    docker-compose
    emacs
    firefox
    ghostty
    gnome-calculator
    gnome-tweaks
    gparted
    grimblast
    htop-vim
    hyprshot
    libnotify
    ltspice
    nautilus
    fastfetch
    neovim
    ollama
    openconnect
    openocd
    pamixer
    papirus-icon-theme
    pavucontrol
    pika-backup
    quickemu
    rofi-bluetooth
    rofi-power-menu
    awww
    tree
    vesktop
    vscode
    zed.packages.${pkgs.stdenv.hostPlatform.system}.default
    zathura
    zoom-us
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
