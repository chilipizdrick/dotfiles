{
  config,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Automatically login on startup
  services.getty.autologinUser = config.users.users.alex.name;
  services.getty.autologinOnce = true;

  environment.systemPackages = with pkgs; [
    hyprland-qtutils
  ];
}
