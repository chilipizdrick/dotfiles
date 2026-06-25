{pkgs, ...}: {
  imports = [
    ./qt
    ./cursor
    ./gammastep
    ./gtk
    ./hypridle
    ./hyprland
    ./hyprlock
    ./mako
    ./swww
    ./vicinae
    ./waybar
    ./wlogout
  ];

  programs.fish = {
    enable = true;
    loginShellInit =
      # fish
      ''
        if test (tty) = "/dev/tty1"; and test -z "$WAYLAND_DISPLAY"
          exec ${pkgs.hyprland}/bin/start-hyprland
        end
      '';
  };
}
