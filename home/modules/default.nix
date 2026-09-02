{...}: {
  imports = [
    ./aliases
    ./apps
    ./fonts
    ./games
    ./hyprland-desktop
    ./mime-apps
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "26.05";
}
