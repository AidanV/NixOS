{ pkgs, ... }:

{
  imports = [
    ./terminals
    ./helix
    ./lsp
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
    neofetch
    # obsidian
    bitwarden
    discord
    gnomeExtensions.blur-my-shell
    gnome.gnome-tweaks
    bibata-cursors
    papirus-icon-theme
    vscode
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
