{...}: {
  imports = [
    ./hardware-configuration.nix
    ../baseConfiguraion.nix
  ];

  nvidiaVideoDrivers.enable = true;

  # Enable ambilight support
  hyperion.enable = true;

  networking.hostName = "aurora";
}
