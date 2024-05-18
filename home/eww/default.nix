{ ... }:
{
  programs.eww = {
    enable = true;
    configDir = ./eww_config;
  };
  # home.file."${config.home.homeDirectory}/.config/eww/eww.scss".source = ./eww.scss;
  # home.file."${config.home.homeDirectory}/.config/eww/eww.yuck".source = ./eww.yuck;
# 
  # # scripts
  # home.file."${config.home.homeDirectory}/.config/eww/scripts/battery" = {
    # source = ./scripts/battery;
    # executable = true;
  # };
# 
  # home.file."${config.home.homeDirectory}/.config/eww/scripts/wifi" = {
    # source = ./scripts/wifi;
    # executable = true;
  # };
# 
  # home.file."${config.home.homeDirectory}/.config/eww/scripts/workspace" = {
    # source = ./scripts/workspace;
    # executable = true;
  # };
# 
  # home.file."${config.home.homeDirectory}/.config/eww/scripts/popup" = {
    # source = ./scripts/popup;
    # executable = true;
  # };
# 
  # home.file."${config.home.homeDirectory}/.config/eww/scripts/calendar" = {
    # source = ./scripts/calendar;
    # executable = true;
  # };
}
