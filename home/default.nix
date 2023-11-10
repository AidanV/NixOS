{config, pkgs, ... }:

{
  imports = [
    ./terminals
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
  ];
  programs.starship.enable = true;

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
