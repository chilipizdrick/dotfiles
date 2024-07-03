{...}: {
  imports = [
    ./hardware-configuration.nix
    ../baseConfiguraion.nix
  ];

  # Nvidia video drivers
  nvidiaVideoDrivers.enable = true;

  networking.hostName = "aurora";
}
