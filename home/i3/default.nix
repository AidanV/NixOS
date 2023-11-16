{config, pkgs, lib, ... }:

let mod = "Mod4";
in {
  xsession =  {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = mod;
      };
    };
  };
}
