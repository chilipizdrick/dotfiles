{...}: {
  # Mount, trash, and other functionalities
  services.gvfs.enable = true;

  # Thumbnail support for images
  services.tumbler.enable = true;

  # Configure PAM to enable hyprock to perform authentication
  security.pam.services.hyprlock = {};

  # Allow discovery of connected monitors
  hardware.i2c.enable = true;

  programs.dconf.enable = true;

  # Hide boot log sequence
  # boot.plymouth.enable = true;
}
