{pkgs, ...}: {
  wayland.windowManager.hyprland.extraConfig =
    # lua
    ''
      hl.monitor({ output = "eDP-1", mode = "highres", position = "auto", scale = 1.666667 })

      hl.on("hyprland.start", function()
        hl.exec_cmd("${pkgs.xrdb}/bin/xrdb ~/.Xresources")
      end)

      hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("loginctl lock-session"))
    '';

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
    heroic = true;
  };
}
