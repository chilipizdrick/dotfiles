{pkgs, ...}: {
  imports = [
    ./style.nix
  ];

  home.packages = with pkgs; [
    rofi-wayland
    # (rofi-wayland.override {
    #   plugins = [
    #     (pkgs.rofi-calc.override {
    #       rofi-unwrapped = pkgs.rofi-wayland-unwrapped;
    #     })
    #   ];
    # })
  ];

  # programs.rofi = {
  #   enable = true;
  #   package = pkgs.rofi-wayland;
  #   plugins = [(pkgs.rofi-calc.override {rofi-unwrapped = pkgs.rofi-wayland-unwrapped;})];
  #   terminal = "${pkgs.alacritty}/bin/alacritty";
  #   extraConfig = {
  #     "@theme" = "~/.config/rofi/themes/nova-dark.rasi";
  #   };
  # };
}
