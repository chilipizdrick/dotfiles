{self, ...} @ inputs: let
  nixosModule = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      inputs.disko.nixosModules.disko
      ./_disko.nix
      ./_hardware-configuration.nix
    ];

    amdVideoDrivers.enable = true;

    games = {
      enable = true;
      steam = true;
      gamescope = true;
      minecraft = true;
    };

    environment.systemPackages = with pkgs; [(btop.override {rocmSupport = true;})];

    services.displayManager.noctalia-greeter.settings.output.scale = 1.666667;

    services.upower.enable = true;
    services.thermald.enable = true;

    networking.hostName = "atlas";

    home-manager.users.alex = {
      wayland.windowManager.hyprland.extraConfig = let
        xrdbConfig = pkgs.writeText "xrdb-config" ''
          Xft.dpi: 154
        '';
      in
        # lua
        ''
          hl.monitor({ output = "eDP-1", mode = "highres", position = "auto", scale = 1.6 })

          hl.on("hyprland.start", function()
            hl.exec_cmd("${pkgs.xrdb}/bin/xrdb ${xrdbConfig}")
          end)
        '';

      programs.noctalia.settings = {
        idle.behavior."Lock & Suspend then Hibernate".enabled = lib.mkForce true;
        idle.behavior.lock-and-suspend.enabled = lib.mkForce false;
      };

      games = {
        enable = true;
        minecraft = true;
      };
    };
  };
in {
  nixosConfigurations.atlas = self.lib.nixosSystem {inherit inputs;} [nixosModule];
}
