{pkgs, ...}: {
  imports = [
    ./config.nix
    ./style.nix
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  # home.packages = [
  #   pkgs.cantarell-fonts
  #   pkgs.minecraftia
  # ];
}
