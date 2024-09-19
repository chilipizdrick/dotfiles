{...}: {
  imports = [
    ./hardware-configuration.nix
    ../baseDesktopConfiguraion.nix
  ];

  nvidiaVideoDrivers.enable = true;

  # Enable ambilight support
  hyperion.enable = true;

  # Printer and scanner config
  printerScanner.enable = true;

  games = {
    enable = true;
    steam = true;
  };

  networking.hostName = "aurora";
}
