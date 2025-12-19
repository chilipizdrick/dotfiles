{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../base-configuraion.nix
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

  # services.tailscaleNetns = {
  #   enable = true;
  #   exitNode = "100.64.0.4";
  #   extraUpFlags = ["--accept-dns=false"];
  # };

  environment.systemPackages = with pkgs; [
    (btop.override {rocmSupport = true;})
  ];

  networking.hostName = "atlas";
}
