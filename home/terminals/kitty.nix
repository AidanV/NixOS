{ config, ... }: 
{
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.kitty.enable
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.9";
      dynamic_background_opacity = true;
      hide_window_decorations = true;
      # linux_display_server = "wayland";
    };
    theme = "Gruvbox Material Dark Soft";
  };

}
