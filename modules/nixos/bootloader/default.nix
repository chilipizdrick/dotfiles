{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    systemd-boot.enable = false;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 2;
    };
    grub2-theme = {
      enable = true;
      theme = "whitesur";
      footer = true;
    };
  };
}
