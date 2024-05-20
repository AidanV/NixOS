# Edit this configuration file to define what should be installed on your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual 
# (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Flakes
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # Bootloader.
  boot = {
    resumeDevice = "/dev/nvme0n1p7";
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

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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

  hardware.opengl.enable = true;

  # possible background:  https://github.com/NixOS/nixos-artwork/blob/master/wallpapers/nix-wallpaper-nineish-dark-gray.png

  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  # programs.virt-manager.enable = true;  

  # Hyprland
  # virtualisation.vmware.guest.enable = true;
  # environment.sessionVariables = rec {
  #   WLR_NO_HARDWARE_CURSORS = "1";
  #   WLR_RENDERER_ALLOW_SOFTWARE = "1";
  # };
  # programs.hyprland =  {
  #   enable = true;
  #   package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  # };
  programs.dconf.enable = true;

  # programs.waybar.enable = true;
  programs.hyprland.enable = true;

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  # Hyprland

  # GNOME
  # services.xserver.enable = true;

  # # # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true; 
  # services.xserver.desktopManager.gnome.enable = true;

  # # # Configure keymap in X11
  # services.xserver = { 
  #   layout = "us"; 
  #   xkbVariant = ""; 
  # };
  # GNOME
  services = {
    libinput.enable = true;
    xserver = {
      enable = true;
      # displayManager.sddm.enable = true;
      # displayManager.sddm.wayland.enable = true;
      # displayManager.gdm.enable = true;
      # desktopManager.gnome.enable = true;
      xkb = {
        variant = "";
        layout = "us";
      };
    };
  };

  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';

  # Power
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

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

  # Enable sound with pipewire.
  # sound.enable = true; 
  # hardware.pulseaudio.enable = false; 
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.pam.services.swaylock = { };
  services.dbus.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    # If you want to use JACK applications, uncomment this jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default, no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aidan = {
    isNormalUser = true;
    description = "aidan";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    gitFull
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
    gnome.adwaita-icon-theme
    nixfmt-rfc-style
  ];

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
    NIXOS_OZONE_WL = "1";
    # _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    fira-code
    font-awesome
    cantarell-fonts
    material-icons
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "Iosevka"
      ];
    })
  ];
  #   fonts.fontconfig.defaultFonts.monospace = [
  #     "JetBrainsMono"
  #     "noto-fonts"
  #     "noto-fonts-cjk"
  #     "noto-fonts-emoji"
  #     "noto-fonts-extra"
  #   ];
  fonts.fontDir.enable = true;

  # Some programs need SUID wrappers, can be configured further or are started in user sessions. programs.mtr.enable = true; programs.gnupg.agent = {
  #   enable = true; enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon. services.openssh.enable = true;

  # Open ports in the firewall. networking.firewall.allowedTCPPorts = [ ... ]; networking.firewall.allowedUDPPorts = [ ... ]; Or disable the firewall altogether. 
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default settings for stateful data, like file locations and database versions on your system were taken. It‘s 
  # perfectly fine and recommended to leave this value at the release version of the first install of this system. Before changing this value read the documentation for 
  # this option (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
