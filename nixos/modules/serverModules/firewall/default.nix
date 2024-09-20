{...}: {
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [22 80 2633];
    };
  };
}
