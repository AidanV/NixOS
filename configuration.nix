# Edit this configuration file to define what should be installed on your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual
# (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Flakes
  nix.settings = {
    trusted-users = [ "root" "aidan" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://cache.iog.io"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # Bootloader
  boot = {
    resumeDevice = "/dev/nvme0n1p3";
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "ntfs" ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  networking.extraHosts = "libvirt_guest";
  services.resolved.enable = true;
  networking.nameservers = [ "8.8.8.8" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-fortisslvpn
      networkmanager-iodine
      networkmanager-l2tp
      networkmanager-openconnect
      networkmanager-openvpn
      networkmanager-sstp
      networkmanager-strongswan
      networkmanager-vpnc
    ];
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      libvdpau-va-gl
      mesa
    ];
  };

  # possible background:  https://github.com/NixOS/nixos-artwork/blob/master/wallpapers/nix-wallpaper-nineish-dark-gray.png

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    virtualbox.host = {
      enable = false;
      enableKvm = true;
      addNetworkInterface = false;
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;

  programs = {
    dconf.enable = true;
    gpu-screen-recorder.enable = true;
    hyprland.enable = true;
    kdeconnect.enable = true;
    localsend.enable = true;
    steam.enable = true;
    virt-manager.enable = true;
    xwayland.enable = true;
    zsh.enable = true;
  };

  services = {
    libinput.enable = true;
    xserver = {
      enable = true;
      xkb = {
        variant = "";
        layout = "us";
      };
    };
    displayManager.ly.enable = true;
    power-profiles-daemon.enable = true;
    dbus.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    linux-enable-ir-emitter.enable = true;
    howdy = {
      enable = true;
      control = "sufficient";
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.logind.settings.Login = {
    # don’t shutdown when power button is short-pressed
    HandlePowerKey = "ignore";
  };

  # Power
  services = {
    upower.enable = true;
    thermald.enable = true;
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", KERNEL=="BAT0", ATTR{charge_control_end_threshold}="80"
    # Arduino
    SUBSYSTEM=="tty", ATTRS{idVendor}=="2341", GROUP="dialout", MODE="0660"
    # CH340 clones
    SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", GROUP="dialout", MODE="0660"
  '';

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.kanata = {
    enable = true;
    keyboards = {
      "asus".config = ''
        (defsrc
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          caps a    s    d    f    g    h    j    k    l    ;    '    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt comp rctl
        )
        (deflayer qwerty
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          esc  a    s    d    f    g    h    j    k    l    ;    '    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt comp rctl
        )
      '';
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.flipperzero.enable = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock = { };
    pam.howdy.enable = false;
  };

  environment.pathsToLink = [ "/share/zsh" ];

  users.users.aidan = {
    isNormalUser = true;
    description = "aidan";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "audio"
      "video"
      "render"
      "libvirtd"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    gitFull
    jujutsu
    wget
    curl
    helix
    ncdu
    brightnessctl
    yazi
    wl-clipboard
    kanata
    borgbackup
    unzip
    adwaita-icon-theme
    nixfmt
    vulkan-loader
    vulkan-tools
    mpv
    gpu-screen-recorder
    gpu-screen-recorder-gtk
  ];

  services.tailscale.enable = true;

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

  environment.variables = {
    EDITOR = "vim";
    BROWSER = "zen";
    GTK_USE_PORTAL = 1;
    TERMINAL = "ghostty";
    NIXOS_OZONE_WL = "1";
    XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      font-awesome
      cantarell-fonts
      material-icons
    ];
    fontDir.enable = true;
  };
  # nerd-fonts
  # (nerdfonts.override {
  #   fonts = [
  #     "JetBrainsMono"
  #     "Iosevka"
  #   ];
  # })

  # Some programs need SUID wrappers, can be configured further or are started in user sessions. programs.mtr.enable = true; programs.gnupg.agent = {
  #   enable = true; enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall. networking.firewall.allowedTCPPorts = [ ... ]; networking.firewall.allowedUDPPorts = [ ... ]; Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default settings for stateful data, like file locations and database versions on your system were taken. It‘s
  # perfectly fine and recommended to leave this value at the release version of the first install of this system. Before changing this value read the documentation for
  # this option (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
