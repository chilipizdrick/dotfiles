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

  # This garbage is throttling my system startup time
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
