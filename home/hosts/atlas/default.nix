{
  lib,
  pkgs,
  scripts,
  ...
}: let
  scale = "1.666667";
in {
  imports = [
    ../base-home.nix
  ];

  services.hypridle.settings.listener = lib.mkForce [
    {
      timeout = 600;
      on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
    }
    {
      timeout = 900;
      on-timeout = "systemctl suspend";
    }
  ];

  hyprlock = {
    enable = true;
    scale = 1.5;
  };

  wayland.windowManager.hyprland = let
    mod = "SUPER";
  in {
    settings = {
      monitor = lib.mkForce [
        "eDP-1,highres,auto,${scale}"
        ",preferred,auto,${scale},mirror,eDP-1"
      ];
      bind = [
        "${mod} ALT,W,exec,${scripts.setup-workflow-atlas}/bin/setup-workflow-atlas"
      ];
      exec-once = [
        "${pkgs.xorg.xrdb}/bin/xrdb ~/.Xresources"
      ];
    };
  };

  # Force scaling for x11 apps
  home.file.".Xresources".text = ''
    Xft.dpi: 160
    Xft.autohint: 0
    Xft.lcdfilter: lcddefault
    Xft.hintstyle: hintfull
    Xft.hinting: 1
    Xft.antialias: 1
    Xft.rgba: rgb

    Xcursor.size: 20
    Xcursor.theme: Bibata-Modern-Classic
  '';

  games = {
    enable = true;
    minecraft = true;
    heroic = false;
    r2modman = true;
  };
}
