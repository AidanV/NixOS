{ pkgs, ...}:{
  
  programs.git = {
    enable = true;
    userName = "AidanV";
    userEmail = "aidanvanduyne@gmail.com";
    extraConfig = {
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };
}
