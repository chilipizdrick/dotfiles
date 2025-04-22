{
  inputs,
  pkgs,
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
    gamescope = true;
    minecraft = true;
  };

  swapFile = {
    enable = true;
    size = 16;
  };

  networking.hostName = "atlas";

  environment.systemPackages = [inputs.sl1.packages.${pkgs.system}.sl1-desktop];
}
