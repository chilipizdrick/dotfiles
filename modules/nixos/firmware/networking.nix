{...}: {
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [24 80 443 25565];
    allowedUDPPortRanges = [
      {
        from = 25565;
        to = 25565;
      }
      {
        from = 24;
        to = 24;
      }
    ];
  };
}
