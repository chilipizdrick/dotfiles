{...}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [25565 34197];
    allowedUDPPorts = [25565 4950 4955 34197];
  };
}
