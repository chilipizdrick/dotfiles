{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../baseDesktopConfiguraion.nix
  ];

  programs.hyprland = {
    package = lib.mkForce pkgs.hyprland;
  };

  amdVideoDrivers.enable = true;
  games = {
    enable = true;
    steam = true;
  };

  networking.hostName = "atlas";
}
