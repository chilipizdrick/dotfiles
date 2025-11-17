{...}: {
  imports = [
    ../modules
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
