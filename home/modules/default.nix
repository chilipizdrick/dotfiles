{
  self',
  pkgs,
  ...
}: {
  imports = [
    ./aliases
    ./apps
    ./fonts
    ./games
    ./hyprland-desktop
    ./mime-apps
  ];

  wayland.windowManager.hyprland.extraConfig =
    # lua
    ''
      hl.on("hyprland.start", function()
        hl.exec_cmd("${self'.packages.daemonologist}/bin/daemonologist")
        hl.exec_cmd("${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit")
      end)
    '';

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "26.05";
}
