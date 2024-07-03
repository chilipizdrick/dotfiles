{...}: {
  imports = [
    ./video-drives
    ./audio.nix
    ./bluetooth.nix
    ./graphicalTablet.nix
    ./networking.nix
    ./power-management.nix
    ./printing.nix
    ./time.nix
    ./touchpad.nix
  ];

  # Driver and other firmware updates
  services.fwupd.enable = true;
  hardware.enableAllFirmware = true;

  # All of my machines have AMD cpus
  hardware.cpu.amd.updateMicrocode = true;
}
