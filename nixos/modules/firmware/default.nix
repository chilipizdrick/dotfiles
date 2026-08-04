{...}: {
  imports = [
    # ./graphical-tablet
    ./audio
    ./bluetooth
    ./power-management
    ./printing
    ./video-drives
  ];

  services.libinput.enable = true;

  time.timeZone = "Europe/Moscow";

  networking.networkmanager.enable = true;

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
}
