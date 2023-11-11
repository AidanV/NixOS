{config, ...}:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
        }
      ];
    };
  };
}
