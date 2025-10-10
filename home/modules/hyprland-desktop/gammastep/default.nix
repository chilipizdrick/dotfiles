{...}: {
  services.gammastep = {
    enable = true;
    tray = false;
    dawnTime = "6:30-7:00";
    duskTime = "19:00-19:30";
    temperature = {
      day = 6500;
      night = 3700;
    };
  };
}
