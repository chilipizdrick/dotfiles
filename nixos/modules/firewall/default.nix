{...}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [25565];
    allowedUDPPorts = [25565 4950 4955];
  };
}
