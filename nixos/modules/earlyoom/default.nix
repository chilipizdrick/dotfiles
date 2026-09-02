{...}: {
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 3;
    enableNotifications = true;
  };

  systemd.oomd.enable = false;
}
