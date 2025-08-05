{
  inputs',
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../base-configuraion.nix
  ];

  # working config for aurora
  services.zapret = {
    enable = true;
    params = [
      "--dpi-desync=fakedsplit"
      "--dpi-desync-ttl=5"
      "--dpi-desync-split-pos=method+2"
    ];
  };

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

  environment.systemPackages = [inputs'.sl1.packages.default];

  # hardware.bluetooth.settings.General.ControllerMode = lib.mkForce "bredr";

  boot.loader.timeout = lib.mkForce null;
  boot.loader.systemd-boot.windows.windows-11 = {
    title = "Windows 11";
    efiDeviceHandle = "FS0";
  };

  networking.hostName = "aurora";
}
