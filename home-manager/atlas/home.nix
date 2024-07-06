{lib, ...}: {
  imports = [
    ../baseHome.nix
  ];
  services.hypridle.settings.listener = lib.mkForce [
    {
      timeout = 300;
      on-timeout = "hyprlock";
    }
    {
      timeout = 360;
      on-timeout = "systemctl suspend";
    }
  ];
}
