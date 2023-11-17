{config, pkgs, lib, ... }:

let mod = "Mod4";
in {
  xsession =  {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = mod;
        keybindings = lib.mkOptionDefault{
          # Rofi
          "${mod}+space" = "exec rofi -show run";

          # Focus
          "${mod}+h" = "focus left";
          "${mod}+l" = "focus right";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";

          # Move
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+l" = "move right";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
        };
      };
    };
  };
}
