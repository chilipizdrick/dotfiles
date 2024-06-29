{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };
  home.packages = with pkgs; [
    hypridle
    hyprlock
    wl-clipboard # Clipboard functionality
    pamixer # Pulseauido command line mixer
    brightnessctl # Read and controll device brightness
    swww # Fancy wallpapers
    libnotify # For sending custom notifications
    cava # Terminal audio visualiser
    grim # Screenshot functionality
    slurp # Screenshot functionality
    networkmanagerapplet # Easy network connection management
    killall # Self explainatory
  ];
  home.file.".config/hypr".source = ./config;
  # home.file."Pictures/wallpapers".source = ./wallpapers;
}
