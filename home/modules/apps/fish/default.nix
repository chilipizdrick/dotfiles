{...}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nsn = "nix shell nixpkgs#";
    };
    shellInit = ''
      set fish_greeting
    '';
  };
}
