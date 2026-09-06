{pkgs, ...}: {
  time.timeZone = "Europe/Moscow";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.nix-ld.enable = true;
  security.polkit.enable = true;
  # programs.mango.enable = true;

  system.stateVersion = "26.05";
}
