{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nsn = "nix shell nixpkgs#";
    };
  };

  environment.shells = [pkgs.fish];
}
