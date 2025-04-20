{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../base-configuraion.nix
  ];

  nvidiaVideoDrivers.enable = true;

  # Enable ambilight support
  hyperion.enable = true;

  # Printer and scanner config
  printerScanner.enable = true;

  games = {
    enable = true;
    steam = true;
    minecraft = true;
  };

  environment.systemPackages = [inputs.sl1.packages.${pkgs.system}.sl1-desktop];

  hardware.bluetooth.settings.General.ControllerMode = lib.mkForce "bredr";
  networking.hostName = "aurora";
}
