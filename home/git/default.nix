{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "AidanV";
        email = "aidanvanduyne@gmail.com";
      };
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      pull.rebase = true;
      init.defaultBranch = "main";
      diff.tool = "zed";
      difftool.zed.cmd = "zed --wait --diff ''$LOCAL ''$REMOTE";
    };
    signing.format = "openpgp";
  };
}
