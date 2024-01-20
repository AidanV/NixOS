{ pkgs, ... }:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
    ./i3
    ./rofi
    ./hyprland
    ./waybar
    # ./sway
  ];
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";

  programs.git = {
    enable = true;
    userName = "AidanV";
    userEmail = "aidanvanduyne@gmail.com";
    extraConfig = {
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };

  home.packages = with pkgs; [
    firefox-wayland
    floorp
    neofetch
    # obsidian
    bitwarden
    discord
    gnome.nautilus
    swww
    eww-wayland
    pavucontrol
    pamixer
    swaylock-effects swayidle wlogout swaybg swaynotificationcenter
    hyprland-protocols
    wl-clipboard
    libnotify
    gnome.gnome-calculator
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
