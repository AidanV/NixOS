{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    # font.name = "TeX Gyre Adventor 10";
    theme = {
      name = "Adwaita-dark"; # "Juno";
      package = pkgs.gnome-themes-extra; # pkgs.juno-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=Bibata-Modern-Classic
      '';
    };

    gtk4 = {
      theme = config.gtk.theme;
      extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
          gtk-cursor-theme-name=Bibata-Modern-Classic
        '';
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    extraConfig = ''
      ${builtins.readFile ./hyprland.conf}
    '';
  };
}
