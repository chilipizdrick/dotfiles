{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../baseConfiguraion.nix
  ];

  amdVideoDrivers.enable = true;

  programs.hyprland = {
    package = lib.mkForce pkgs.hyprland; #Hyprland 0.42.0+ does not work on this machine for some reason
  };

  swapFile.enable = true;

  networking.hostName = "atlas";
}
