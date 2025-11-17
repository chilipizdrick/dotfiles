{
  pkgs,
  lib,
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

  boot.loader.timeout = lib.mkForce null;
  boot.loader.systemd-boot.windows.windows-11 = {
    title = "Windows 11";
    efiDeviceHandle = "FS0";
  };

  environment.systemPackages = with pkgs; [
    hyperion-ng
    (btop.override {cudaSupport = true;})
  ];

  networking.hostName = "aurora";
}
