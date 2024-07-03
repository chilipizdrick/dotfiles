{...}: {
  imports = [
    ./hardware-configuration.nix
    ../baseConfiguraion.nix
  ];

  # AMD video drivers
  amdVideoDrivers.enable = true;

  networking.hostName = "atlas";
}
