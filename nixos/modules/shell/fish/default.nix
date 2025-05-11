{...}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nsn = "nix shell nixpkgs#";
    };
  };
}
