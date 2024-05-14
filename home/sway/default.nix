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
      input = {
        "type:touchpad" = {
          click_method = "clickfinger";
          natural_scroll = "enabled";
        };
      };
      # floating.titlebar = false;
      keybindings = lib.mkOptionDefault {
        "XF86PowerOff" = "exec swaylock; exec 'systemctl hibernate'";
        "XF86MonBrightnessDown" = "exec light -U 10";
        "XF86MonBrightnessUp" = "exec light -A 10";
        "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'";
        "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'";
        "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
        "XF86Launch1" = "exec swaylock; exec 'systemctl suspend'";
		"Print" =  "exec wayshot -s \"$(slurp)\" --stdout | wl-copy";
		"XF86SelectiveScreenshot" =  "grim -g \"$(slurp)\" \"/home/aidan/Pictures/Screenshots/screenshot$(date +\"%s\").png";
      };
    };
  };
}
