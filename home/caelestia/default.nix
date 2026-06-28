{
  config,
  pkgs,
  lib,
  ...
}:

let
  caelestiaConfigDir = ./.;

  # Patch Caelestia's bundled PAM config so the lock screen tries Howdy,
  # then falls back to the password prompt.
  caelestia-shell = pkgs.caelestia-shell.overrideAttrs (old: {
    prePatch = (old.prePatch or "") + ''
      sed -i '1a auth sufficient ${pkgs.howdy}/lib/security/pam_howdy.so' \
        assets/pam.d/passwd
    '';
  });
in
{
  home.packages = [
    caelestia-shell
    pkgs.caelestia-cli
  ];
  home.file.".config/caelestia/shell.json" = {
    source = ./shell.json;
    recursive = true;
  };
}
