{pkgs, ...}: {
  imports = [
    ./style.nix
  ];

  home.packages = with pkgs; [
    rofi-wayland
  ];

  # programs.rofi = {
  #   enable = true;
  #   package = pkgs.rofi-wayland;
  #   plugins = [(pkgs.rofi-calc.override {rofi-unwrapped = pkgs.rofi-wayland-unwrapped;})];
  #   terminal = "${pkgs.alacritty}/bin/alacritty";
  # };
}
