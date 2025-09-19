{...}: {
  imports = [
    ../modules
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        rofi = prev.rofi.override {
          plugins = [
            prev.rofi-calc
          ];
        };
      })
    ];
  };

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
