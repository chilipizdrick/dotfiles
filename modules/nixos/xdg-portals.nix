{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
    config = {
      hyprland = {
        default = ["hyprland" "kde"];
        "org.freedesktop.impl.portal.ScreenCast" = ["hyprland"];
        "org.freedesktop.impl.portal.Screenshot" = ["hyprland"];
        "org.freedesktop.impl.portal.GlobalShortcuts" = ["hyprland"];
        "org.freedesktop.impl.portal.InputCapture" = ["hyprland"];
      };
    };
  };

  # Needed for xdg-desktop-portal-kde to work correctly
  environment.systemPackages = [
    pkgs.kdePackages.kio
    pkgs.kdePackages.kio-extras
    pkgs.qt6.qtsvg
    pkgs.shared-mime-info
  ];
}
