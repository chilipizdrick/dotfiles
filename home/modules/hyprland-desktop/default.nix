{...}: {
  imports = [
    # ./awww
    # ./gammastep
    # ./hypridle
    # ./hyprlock
    # ./mako
    # ./vicinae
    # ./waybar
    # ./wlogout
    ./cursor
    ./gtk
    ./hyprland
    ./noctalia
    ./qt
  ];

  # programs.fish = {
  #   enable = true;
  #   loginShellInit =
  #     # fish
  #     ''
  #       if test (tty) = "/dev/tty1"; and test -z "$WAYLAND_DISPLAY"
  #         exec ${pkgs.hyprland}/bin/start-hyprland
  #       end
  #     '';
  # };
}
