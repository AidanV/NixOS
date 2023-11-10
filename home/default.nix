{config, pkgs, ... }:

{
  home.username = "aidan";
  home.homeDirectory = "/home/aidan";

  programs.git = {
    enable = true;
    userName = "AidanV";
    userEmail = "aidanvanduyne@gmail.com";
  };

  home.packages = with pkgs; [
    neofetch
    kitty
  ];
  programs.starship.enable = true;

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
