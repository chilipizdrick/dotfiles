{...}: {
  services.libinput.enable = true;

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
}
