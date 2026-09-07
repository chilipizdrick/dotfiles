{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nsn = "nix shell nixpkgs#";
    };
    shellInit = ''
      set fish_greeting
      bind " " expand-abbr or self-insert
      export NIXPKGS_ALLOW_UNFREE=1
      set -U fish_color_command blue
    '';
  };
}
