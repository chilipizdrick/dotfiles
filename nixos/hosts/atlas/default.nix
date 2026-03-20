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

  environment.systemPackages = with pkgs; [
    (btop.override {rocmSupport = true;})
    # androidenv.androidPkgs.androidsdk
  ];

  # services.splitTunneling = {
  #   enable = true;
  #   user = "novpn";
  #   tableId = 200;
  # };

  networking.hostName = "atlas";
}
