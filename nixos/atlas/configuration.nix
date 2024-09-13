{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../baseConfiguraion.nix
  ];

  amdVideoDrivers.enable = true;

  programs.hyprland = {
    package = lib.mkForce pkgs.hyprland; #Hyprland 0.42.0+ does not work on this machine for some reason
    # package = lib.mkForce inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland-legacy-renderer;
  };

  # swapFile.enable = true;

  games = {
    enable = true;
    steam = true;
  };

  networking.hostName = "atlas";
}
