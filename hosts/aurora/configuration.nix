{self, ...} @ inputs: let
  nixosModule = {
    pkgs,
    lib,
    ...
  }: {
    imports = [ ./_hardware-configuration.nix ];

    nvidiaVideoDrivers.enable = true;

    # Printer and scanner config
    printerScanner.enable = true;

    games = {
      enable = true;
      steam = true;
      minecraft = true;
    };

    services.displayManager.noctalia-greeter.settings.output.name = "HDMI-A-1";

    boot.loader.timeout = lib.mkForce null;
    boot.loader.systemd-boot.windows.windows-11 = {
      title = "Windows 11";
      efiDeviceHandle = "FS0";
    };

    environment.systemPackages = with pkgs; [
      (btop.override {cudaSupport = true;})
    ];

    networking.hostName = "aurora";
  };

  homeModule = {pkgs, ...}: {
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

        hl.on("hyprland.start", function()
          hl.timer(function()
            hl.exec_cmd("${pkgs.hyperhdr}/bin/hyperhdr")
          end, {timeout = 6000, type = "oneshot"})
        end)
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

    home.packages = with pkgs; [
      hyperhdr
    ];
  };
in {
  nixosConfigurations.aurora = self.lib.nixosSystem {
    inherit inputs;
    extraModules = [nixosModule];
  };
  homeConfigurations."alex@aurora" = self.lib.homeManagerConfiguration {
    inherit inputs;
    extraModules = [homeModule];
  };
}
