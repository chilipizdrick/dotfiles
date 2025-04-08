{pkgs, ...}: {
  imports = [
    ./config.nix
    ./style.nix
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  home.packages = with pkgs; [playerctl];
}
