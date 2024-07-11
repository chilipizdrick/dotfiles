{...}: {
  imports = [
    ./hardware-configuration.nix
    ../baseConfiguraion.nix
  ];

  amdVideoDrivers.enable = true;

  swapFile.enable = true;

  networking.hostName = "atlas";
}
