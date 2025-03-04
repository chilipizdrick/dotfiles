{...}: {
  services.gammastep = {
    enable = true;
    tray = true;
    provider = "manual";
    dawnTime = "6:00-7:00";
    duskTime = "21:00-22:00";
  };
}
