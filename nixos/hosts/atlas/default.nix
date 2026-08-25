{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  amdVideoDrivers.enable = true;

  games = {
    enable = true;
    steam = true;
    gamescope = true;
    minecraft = true;
  };

  swapFile = {
    enable = true;
    size = 16;
  };

  environment.systemPackages = with pkgs; [
    (btop.override {rocmSupport = true;})
  ];

  services.displayManager.noctalia-greeter.settings.output.scale = 1.666667;

  services.upower.enable = true;
  services.thermald.enable = true;

  networking.hostName = "atlas";
}
