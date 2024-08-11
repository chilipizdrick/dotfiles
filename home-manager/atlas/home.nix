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

  hyprlock = {
    enable = true;
    scale = 1.5;
  };

  wayland.windowManager.hyprland = {
    settings = {
      monitor = lib.mkForce [
        ",preferred,auto,1.666667"
      ];
    };
  };

  games = {
    enable = true;
    minecraft = true;
  };
}
