{
  config,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.hyprland}/bin/start-hyprland";
        user = config.users.users.alex.name;
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd ${pkgs.hyprland}/bin/start-hyprland";
        user = "greeter";
      };
    };
  };

  # Automatically login on startup
  # services.getty.autologinUser = config.users.users.alex.name;
  # services.getty.autologinOnce = true;

  environment.systemPackages = with pkgs; [
    hyprland-qtutils
  ];
}
