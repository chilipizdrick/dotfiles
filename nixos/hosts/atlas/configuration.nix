{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../base-configuraion.nix
  ];

  amdVideoDrivers.enable = true;
  games = {
    enable = true;
    steam = true;
  };

  swapFile = {
    enable = true;
    size = 16;
  };

  networking.hostName = "atlas";
}
