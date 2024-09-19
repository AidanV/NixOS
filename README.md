# This is a NixOS configuration that uses the GNOME Desktop Environment
#### Other Desktop Environments located on other branches

## Recommended steps to install for yourself on NixOS

#### 1. Clone this repo

#### 2. Replace my hardware-configuration.nix with your's

#### 3.Change to your user in configuration.nix
```Nix
users.users.aidan = { # Here
  isNormalUser = true;
  description = "aidan"; # Here
  extraGroups = [
    "networkmanager"
    "wheel"
    "video"
  ];
  shell = pkgs.zsh;
};
```
#### 4. Delete the following from configuration.nix. No need to try to back up to my server :)
```Nix
services.borgbackup.jobs.home-aidan =
  let
    common-excludes = [
      # Largest cache dirs
      ".cache"
      ".cargo"
      "*/cache2" # firefox
      "*/Cache"
      ".config/Code/CachedData"
      ".container-diff"
      ".npm/_cacache"
      # Work related dirs
      "*/node_modules"
      "*/bower_components"
      "*/_build"
      "*/.tox"
      "*/venv"
      "*/.venv"
    ];
  in
  {
    paths = "/home/aidan";
    exclude = common-excludes;
    encryption.mode = "none";
    environment.BORG_RSH = "ssh -o 'StrictHostKeyChecking=no' -i /home/aidan/.ssh/id_rsa";
    repo = "ssh://aidan@vdha.duckdns.org:22/mnt/external_hard/asus_backup";
    compression = "auto,zstd";
    startAt = [ ]; # "daily";
  };
```
#### 5. Change Resume Device
If you would like to be able to hibernate change this in configuration.nix to a valid partition otherwise remove the following
```Nix
# Bootloader
boot = {
  resumeDevice = "/dev/nvme0n1p7"; # This line
  kernelPackages = pkgs.linuxPackages_latest;
  loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  supportedFilesystems = [ "ntfs" ];
};
```
#### 6. Help homemanager out
Go to home/default.nix and change my name to your name
```Nix
home.username = "aidan"
home.homeDirectory = "/home/aidan";
```
#### 7. Set up your git configuration
Go to home/git/default.nix and change my stuff with your stuff
```Nix
{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "AidanV"; # Here
    userEmail = "aidanvanduyne@gmail.com"; # Here
    extraConfig = {
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
}
```


### 8. Rebuild System
Navigate to the repo's root folder and run:
```
sudo nixos-rebuild switch --flake .#nixos
```
If you ever want to upgrade your packages you can run:
```
sudo nix flake update
```
