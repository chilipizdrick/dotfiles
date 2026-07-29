{...}: {
  wayland.windowManager.hyprland.extraConfig =
    # lua
    ''
      hl.monitor({ output = "Unknown-1", disabled = true })
      hl.monitor({ output = "DP-3", mode = "1920x1080@75", position = "0x0", scale = 1 })
      hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1 })

      for i = 1,9 do
        hl.workspace_rule({workspace = i, monitor = "HDMI-A-1"})
      end
      hl.workspace_rule({workspace = 10, monitor = "DP-3"})
    '';

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  games = {
    enable = true;
    minecraft = true;
  };
}
