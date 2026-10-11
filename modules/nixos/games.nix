{pkgs, ...}: {
  hardware.uinput.enable = true;
  services.udev.packages = [
    pkgs.game-devices-udev-rules
  ];
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [temurin-bin-21];
}
