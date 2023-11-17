{ pkgs, ... }: 
let font = pkgs.fira-code;
in {
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.kitty.enable
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.9";
      dynamic_background_opacity = true;
      hide_window_decorations = true;
      # linux_display_server = "wayland";
    };
    shellIntegration.enableZshIntegration = true;
    theme = "Gruvbox Material Dark Soft";
    font = {
      package = font;
      name = "FiraCode";
    };
  };

}
