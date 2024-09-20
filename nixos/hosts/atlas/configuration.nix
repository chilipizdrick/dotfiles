{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../base-configuraion.nix
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
