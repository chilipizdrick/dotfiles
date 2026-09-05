{lib, ...}: {
  # Allow discovery of connected monitors
  hardware.i2c.enable = true;

  # Limit max size of systemd journal
  # services.journald.extraConfig = "SystemMaxUse=50M";

  services.speechd.enable = lib.mkForce false;

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
