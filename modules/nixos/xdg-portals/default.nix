{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      unstable.xdg-desktop-portal-gtk
      # unstable.xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
      hyprland = {
        default = [
          "hyprland"
        ];
      };
    };
  };
}
