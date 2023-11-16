{config, pkgs, ... }:

{
  imports = [
    ./terminals
    ./helix.nix
    ./lsp.nix
    ./i3
    # ./sway
  ];
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";

  programs.git = {
    enable = true;
    userName = "AidanV";
    userEmail = "aidanvanduyne@gmail.com";
  };

  home.packages = with pkgs; [
    firefox-wayland
    neofetch
    obsidian
    bitwarden
    discord
  ];
  # programs.starship.enable = true;

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
