{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../baseConfiguraion.nix
  ];

  nvidiaVideoDrivers.enable = true;

  # Enable ambilight support
  hyperion.enable = true;

  # Games
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [protonup-qt];

  networking.hostName = "aurora";
}
