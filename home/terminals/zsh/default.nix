{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    initExtra = ''
      alias ssh='kitten ssh'
      alias v='vim .'
    '';
  };
}
