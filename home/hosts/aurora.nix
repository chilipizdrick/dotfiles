{
  lib,
  pkgs,
  ...
}: {
  services.hypridle.settings.listener = lib.mkForce [
    {
      timeout = 3600;
      on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
    }
    {
      timeout = 7200;
      on-timeout = "systemctl suspend";
    }
  ];

  hyprlock = {
    enable = true;
    scale = 1.0;
  };

  wayland.windowManager.hyprland.extraConfig =
    # lua
    ''
      hl.monitor({ output = "Unknown-1", disable = true })
      hl.monitor({ output = "DP-3", mode = "1920x1080@75", position = "0x0", scale = 1 })
      hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1 })

      for i = 1,9 do
        hl.workspace_rule(workspace = i, monitor = "HDMI-A-1")
      end
      hl.workspace_rule(workspace = "10", monitor = "DP-3")

      hl.env("LIBVA_DRIVER_NAME", "nvidia")
      hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
      hl.env("GBM_BACKEND", "nvidia-drm")
      hl.env("NVD_BACKEND", "direct")
    '';

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  hyperion.enable = true;

  games = {
    enable = true;
    minecraft = true;
  };
}
