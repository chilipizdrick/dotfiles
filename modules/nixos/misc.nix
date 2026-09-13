{
  pkgs,
  lib,
  ...
}: {
  time.timeZone = "Europe/Moscow";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.firmware = let
    commit = "8ce4ef6cb6f871616146b9fe26d2a5ae594e94fe";
    oldPkgs =
      import (fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/${commit}.tar.gz";
        sha256 = "1df6x8chkipc0j0yawmzr8430zpab5i2xk9hplyq1m5iqcl2c7y4";
      }) {
        system = pkgs.stdenv.hostPlatform.system;
        config.allowUnfree = true;
      };
  in
    lib.mkForce [oldPkgs.linux-firmware];

  programs.nix-ld.enable = true;
  security.polkit.enable = true;

  # Allow discovery of connected monitors
  hardware.i2c.enable = true;

  # Limit max size of systemd journal
  services.journald.settings.Journal.SystemMaxUse = "50M";

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

  system.stateVersion = "26.05";
}
