{lib, ...}: {
  # Mount, trash, and other functionalities
  services.gvfs.enable = true;

  # Thumbnail support for images
  services.tumbler.enable = true;

  # Configure PAM to enable hyprock to perform authentication
  security.pam.services.hyprlock = {};

  # Allow discovery of connected monitors
  hardware.i2c.enable = true;

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        lockAll = true;
        settings = {
          "org/gnome/desktop/media-handling" = {
            automount = false;
            automount-open = false;
            autorun-never = true;
          };
        };
      }
    ];
  };

  # This garbage is killing my system boot time
  systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [];

  # Limit max size of systemd journal
  services.journald.extraConfig = "SystemMaxUse=50M";

  # Disable NixOS manual and such
  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = false;
    doc.enable = false;
    nixos.enable = false;
    info.enable = false;
  };
}
