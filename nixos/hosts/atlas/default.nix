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

  noctalia-greeter = {
    enable = true;
    output.scale = 1.666667;
  };

  services.upower.enable = true;

  networking.hostName = "atlas";
}
