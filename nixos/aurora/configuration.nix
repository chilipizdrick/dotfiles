{...}: {
  imports = [
    ./hardware-configuration.nix
    ../baseConfiguraion.nix
  ];

  # Nvidia video drivers
  nvidiaVideoDrivers.enable = true;

  # Enable ambilight support
  hyperion.enable = true;

  networking.hostName = "aurora";
}
