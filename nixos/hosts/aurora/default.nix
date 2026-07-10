{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
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

  programs.noctalia-greeter.settings.output.name = "HDMI-A-1";

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
