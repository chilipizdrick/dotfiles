{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../base-configuraion.nix
  ];

  # working config for atlas (youtube)
  # services.zapret.params = [
  #   "--dpi-desync=multidisorder"
  #   "--dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1"
  # ];

  # working config for atlas
  # services.zapret = {
  #   enable = true;
  #   params = [
  #     "--dpi-desync=fakedsplit"
  #     "--dpi-desync-ttl=2"
  #     "--dpi-desync-split-pos=1"
  #   ];
  # };

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

  networking.hostName = "atlas";
}
