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
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gsconnect
    gnomeExtensions.forge
    openocd
    openconnect
    docker
    docker-compose
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    kooha
  ];

  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        gsconnect.extensionUuid
        battery-health-charging.extensionUuid
      ];
    };
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  # gtk = {
  #   enable = true;
  #   cursorTheme = {
  #     package = pkgs.bibata-cursors;
  #     name = "bibata-modern-classic";
  #   };
  # };

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
