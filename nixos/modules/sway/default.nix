{
  config,
  lib,
  pkgs,
  ...
}: {
  services.xserver.enable = true;

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      xwayland # One day it will not be here
      waybar # Fancy bar
      grim # Screenshot functionality
      slurp # Screenshot functionality
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      mako # Notification daemon
      swaybg # Support for wallpapers
      swaylock-effects # Screen locker
      swayidle # Idle manager
      wf-recorder # Support for screen capture
      rofi-wayland # Application launcher
      autotiling-rs # Autotiling support
    ];
    # extraSessionCommands = /* bash */''
    #   export XDG_SESSION_TYPE=wayland
    #   export XDG_SESSION_DESKTOP=sway
    #   export XDG_CURRENT_DESKTOP=sway
    #   export SDL_VIDEODRIVER=wayland
    #   export QT_QPA_PLATFORM=wayland-egl
    #   export QT_WAYLAND_FORCE_DPI=physical
    #   export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    #   export GDK_BACKEND=wayland,x11
    #   export ELECTRON_OZONE_PLATFORM_HINT=wayland
    #   export NIXOS_OZONE_WL=1
    #   export _JAVA_AWT_WM_NONREPARENTING=1
    #   export MOZ_ENABLE_WAYLAND=1
    # '';
  };

  # Hint apps to use wayland
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "sway";
    XDG_CURRENT_DESKTOP = "sway";
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_FORCE_DPI = "physical";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland,x11";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Enable xdg-portal-wlr
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # Brightness controll
  programs.light.enable = true;

  # Enable QT theming and other settings
  qt.enable = true;
  qt.platformTheme = "qt5ct";
  qt.style = "adwaita-dark";
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  environment.systemPackages = with pkgs; [
    qt5.qtwayland
  ];
}
