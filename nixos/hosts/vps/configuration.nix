{...}: {
  imports = [
    ./hardware-configuration.nix
    ../baseServerConfiguration.nix
  ];

  time.timeZone = "Europe/Amsterdam";
  networking.hostName = "nl-vps";

  system.stateVersion = "23.11";
}
