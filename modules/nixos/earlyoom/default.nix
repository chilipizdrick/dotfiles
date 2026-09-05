{...}: {
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 1;
    enableNotifications = true;
  };

  systemd.oomd.enable = false;
}
