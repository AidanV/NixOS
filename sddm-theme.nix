{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = builtins.fetchGit {
    url = "https://github.com/MarianArlt/sddm-sugar-light";
    rev = "19bac00e7bd99e0388d289bdde41bf6644b88772";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
