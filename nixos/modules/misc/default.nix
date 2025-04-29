{lib, ...}: {
  # Mount, trash, and other functionalities
  services.gvfs.enable = true;

  # Thumbnail support for images
  services.tumbler.enable = true;

  # Configure PAM to enable hyprock to perform authentication
  security.pam.services.hyprlock = {};

  # Allow discovery of connected monitors
  hardware.i2c.enable = true;

  programs.dconf.enable = true;

  # This garbage is killing my system boot time
  systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [];

  services.journald.extraConfig = "SystemMaxUse=50M";
}
