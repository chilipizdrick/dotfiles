{pkgs, ...}: {
  environment.systemPackages = [pkgs.temurin-bin-21];
  hardware.uinput.enable = true;
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam.enable = true;
  services.udev.packages = [pkgs.game-devices-udev-rules];
}
