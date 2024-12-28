{...}: {
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [24 80 443 25565];
    allowedUDPPortRanges = [
      {
        from = 25565;
        to = 25565;
      }
    ];
  };
}
