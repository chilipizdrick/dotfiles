{...}: {
  services.geoclue2 = {
    enable = true;
    enableWifi = true;
    enableNmea = true;
  };
}
