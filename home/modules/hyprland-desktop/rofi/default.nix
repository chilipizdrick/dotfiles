{pkgs, ...}: {
  imports = [
    ./style.nix
  ];

  home.packages = with pkgs; [
    rofi-wayland
  ];
}
