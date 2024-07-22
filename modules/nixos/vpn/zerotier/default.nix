{...}: {
  services.zerotierone = {
    enable = true;
    joinNetworks = ["e3918db483012445"];
    localConf = {
      setttings = {
        allowManaged = true;
        allowGlobal = true;
        allowDefault = true;
        allowDNS = true;
      };
    };
  };
}
