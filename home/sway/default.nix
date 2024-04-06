{lib, ...}:{
    wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      startup = [
        # Launch Firefox on start
        # {command = "firefox";}
      ];
      keybindings = lib.mkOptionDefault {
        "XF86PowerOff" = "exec swaylock; exec 'systemctl hibernate'";
        # "XF86Launch1" = "exec swaylock; exec 'systemctl hibernate'";
      };
    };
  };
}
