{self, ...} @ inputs: let
  nixosModule = {pkgs, ...}: {
    imports = [
      inputs.disko.nixosModules.disko
      ./disko.nix
      ./hardware-configuration.nix
    ];

    networking.hostName = "atlas";

    environment.systemPackages = [(pkgs.btop.override {rocmSupport = true;})];
    services.displayManager.noctalia-greeter.settings.output.scale = 1.6;
    services.upower.enable = true;
    services.thermald.enable = true;

    home-manager.users.alex = {
      xresources.properties."Xft.dpi" = 154;
      wayland.windowManager.hyprland.extraConfig =
        # lua
        ''
          hl.monitor({ output = "eDP-1", mode = "highres", position = "auto", scale = 1.6 })
          hl.on("hyprland.start", function()
            hl.exec_cmd("${pkgs.xrdb}/bin/xrdb -merge ~/.Xresources")
          end)
        '';
    };
  };
in {
  nixosConfigurations.atlas = self.lib.nixosSystem {inherit inputs;} [nixosModule];
}
