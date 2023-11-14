{pkgs, ...}:
{
  home.packages = with pkgs; [
    nil
    nodePackages.typescript-language-server
  ];
}
