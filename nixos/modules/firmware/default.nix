{...}: {
  imports = [
    # ./graphical-tablet
    ./audio
    ./bluetooth
    ./kernel
    ./networking
    ./power-management
    ./printing
    ./time
    ./touchpad
    ./video-drives
  ];

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
}
