{
  pkgs,
  inputs,
  ...
}: let
  mod = "SUPER";
  files = "${pkgs.nautilus}/bin/nautilus";
  term = "${pkgs.alacritty}/bin/alacritty";
  browser = "${inputs.zen-browser.packages.x86_64-linux.default}/bin/zen";
  left = "H";
  right = "L";
  up = "K";
  down = "J";
  colorsConfig = "$HOME/.config/hypr/themes/catppuccin-mocha.hypr";
in {
  imports = [
    ./colors.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    systemd.variables = ["--all"];
    settings = {
      source = [
        "${colorsConfig}"
      ];

      "debug:disable_logs" = false;
      "debug:enable_stdout_logs" = true;
      "debug:error_limit" = 100;

      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "SDL_VIDEODRIVER,wayland,x11"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "NIXOS_OZONE_WL,1"
        "MOZ_ENABLE_WAYLAND,1"
      ];

      monitor = [
        ",preferred,auto,auto"
      ];

      general = {
        gaps_in = "5,5,0,0";
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "$peach";
        "col.inactive_border" = "$base";
        resize_on_border = false;
        layout = "dwindle";
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        special_scale_factor = 0.8;
      };
      master = {
        new_on_top = 1;
        mfact = 0.5;
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        dim_inactive = false;
        dim_strength = 0.1;
        drop_shadow = true;
        shadow_range = 8;
        shadow_render_power = 2;
        shadow_offset = "2 2";
        "col.shadow" = "rgba(0C0E13A6)";
        blur = {
          enabled = true;
          popups = true;
          size = 5;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = true;
        };
      };
      input = {
        kb_layout = "us,ru";
        kb_variant = "";
        kb_model = "";
        kb_options = "grp:alt_shift_toggle";
        kb_rules = "";
        repeat_rate = 50;
        repeat_delay = 300;
        numlock_by_default = true;
        left_handed = false;
        follow_mouse = true;
        float_switch_override_focus = false;
        touchpad = {
          scroll_factor = 0.5;
          disable_while_typing = true;
          natural_scroll = true;
          clickfinger_behavior = false;
          middle_button_emulation = true;
          tap-to-click = true;
          drag_lock = false;
        };
      };
      gestures = {
        workspace_swipe = true;
      };
      misc = {
        vfr = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        vrr = 2;
        enable_swallow = true;
        focus_on_activate = false;
        swallow_regex = "^(alacritty|kitty|mpv|imv)$";
        initial_workspace_tracking = false;
      };
      binds = {
        workspace_back_and_forth = false;
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };

      animations = {
        enabled = true;
        animation = [
          "windows,on,2,default"
          "windowsIn,on,2,default,slide,top"
          "windowsOut,on,2,default,slide,bottom"
          "workspaces,on,2,default"
        ];
      };

      layerrule = [
        "blur,logout_dialog"
        "blur,rofi"
        "blur,waybar"
        "blur,notifications"
        "ignorezero,waybar"
        "ignorezero,notifications"
        "ignorealpha 0.5,waybar" # Fixes annoying visual effect
        "ignorealpha 0.5,notifications" # Fixes annoying visual effect
        "animation slide,waybar"
      ];

      windowrule = [
        "float,nm-connection-editor|blueman-manager"
        "float,pavucontrol"
        "float,rofi"
        "float,yad"
        # "opacity 0.9,title:^(Spotify)(.*)$"
      ];

      windowrulev2 = [
        "idleinhibit fullscreen, fullscreen:1"
        "opacity 0.95 0.75,title:^(Picture-in-Picture)$"
        "pin,title:^(Picture-in-Picture)$ "
        "float, title:^(Picture-in-Picture)$"
        "size 25% 25%,title:^(Picture-in-Picture)$ "
        "move 72% 7%,title:^(Picture-in-Picture)$ "
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
        "noborder, onworkspace:w[t1]" # Disable borders for single window workspaces
      ];

      exec-once = [
        "${pkgs.hyprlock}/bin/hyprlock --immediate --immediate-render &" # Lock on login
        "${pkgs.hypridle}/bin/hypridle &"
        "${pkgs.waybar}/bin/waybar &"
        "${pkgs.swww}/bin/swww-daemon &"
        "hyprctl setcursor Bibata-Modern-Classic 20"
        "${pkgs.networkmanagerapplet}/bin/nm-applet &"
        "${pkgs.opentabletdriver}/bin/otd-daemon &"
      ];

      bind = [
        "${mod} SHIFT, Q, killactive,"
        "${mod} SHIFT, W, exec, kill -9 $(hyprctl activewindow | grep 'pid:' | awk '{print $2}')"
        "${mod}, F, fullscreen,"
        "${mod} SHIFT, F, togglefloating,"
        "${mod} ALT, F, exec, hyprctl dispatch workspaceopt allfloat"
        "${mod}, ${left}, movefocus, l"
        "${mod}, ${right}, movefocus, r"
        "${mod}, ${up}, movefocus, u"
        "${mod}, ${down}, movefocus, d"
        "${mod} SHIFT, ${left}, movewindow, l"
        "${mod} SHIFT, ${right}, movewindow, r"
        "${mod} SHIFT, ${up}, movewindow, u"
        "${mod} SHIFT, ${down}, movewindow, d"
        "${mod}, G, togglegroup"
        "${mod} SHIFT, code:10, movetoworkspace, 1"
        "${mod} SHIFT, code:11, movetoworkspace, 2"
        "${mod} SHIFT, code:12, movetoworkspace, 3"
        "${mod} SHIFT, code:13, movetoworkspace, 4"
        "${mod} SHIFT, code:14, movetoworkspace, 5"
        "${mod} SHIFT, code:15, movetoworkspace, 6"
        "${mod} SHIFT, code:16, movetoworkspace, 7"
        "${mod} SHIFT, code:17, movetoworkspace, 8"
        "${mod} SHIFT, code:18, movetoworkspace, 9"
        "${mod} SHIFT, code:19, movetoworkspace, 10"
        "${mod} SHIFT, bracketleft, movetoworkspace, -1"
        "${mod} SHIFT, bracketright, movetoworkspace, +1"
        "${mod} CTRL, code:10, movetoworkspacesilent, 1"
        "${mod} CTRL, code:11, movetoworkspacesilent, 2"
        "${mod} CTRL, code:12, movetoworkspacesilent, 3"
        "${mod} CTRL, code:13, movetoworkspacesilent, 4"
        "${mod} CTRL, code:14, movetoworkspacesilent, 5"
        "${mod} CTRL, code:15, movetoworkspacesilent, 6"
        "${mod} CTRL, code:16, movetoworkspacesilent, 7"
        "${mod} CTRL, code:17, movetoworkspacesilent, 8"
        "${mod} CTRL, code:18, movetoworkspacesilent, 9"
        "${mod} CTRL, code:19, movetoworkspacesilent, 10"
        "${mod} CTRL, bracketleft, movetoworkspacesilent, -1"
        "${mod} CTRL, bracketright, movetoworkspacesilent, +1"
        "${mod}, code:10, workspace, 1"
        "${mod}, code:11, workspace, 2"
        "${mod}, code:12, workspace, 3"
        "${mod}, code:13, workspace, 4"
        "${mod}, code:14, workspace, 5"
        "${mod}, code:15, workspace, 6"
        "${mod}, code:16, workspace, 7"
        "${mod}, code:17, workspace, 8"
        "${mod}, code:18, workspace, 9"
        "${mod}, code:19, workspace, 10"
        "${mod}, tab, workspace, m+1"
        "${mod} SHIFT, tab, workspace, m-1"
        "${mod}, mouse_down, workspace, e+1"
        "${mod}, mouse_up, workspace, e-1"
        "${mod}, period, workspace, e+1"
        "${mod}, comma, workspace, e-1"
        "${mod} SHIFT, U, movetoworkspace, special"
        "${mod}, U, togglespecialworkspace,"
        "${mod}, W, exec, ${pkgs.scripts.select-wallpaper}/bin/select-wallpaper"
        "${mod} SHIFT, S, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.imagemagick}/bin/magick - -shave 2x2 PNG:- | ${pkgs.wl-clipboard}/bin/wl-copy"
        "${mod} CTRL, S, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.imagemagick}/bin/magick - -shave 2x2 PNG:- | ${pkgs.swappy}/bin/swappy -f -"
        "${mod}, D, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun -modi drun,calc"
        "ALT, SPACE, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun -modi drun,calc"
        "${mod}, Return, exec, ${term}"
        "${mod}, B, exec, ${browser}"
        "${mod}, E, exec, ${files}"
        "${mod} ALT, R, exec, ${pkgs.scripts.reload-graphical-interface}/bin/reload-graphical-interface" # Refresh waybar, rofi
        "CTRL ALT, Delete, exec, hyprctl dispatch exit"
        "${mod} ALT, C, exec, hyprctl reload"
        "${mod} SHIFT, E, exec, hyprctl dispatch exit"
        "${mod} ALT, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
        "${mod} SHIFT, P, exec, pidof wlogout || ${pkgs.wlogout}/bin/wlogout -b 4"
        "${mod} SHIFT, A, exec, ${pkgs.scripts.toggle-hyprland-settings}/bin/toggle-hyprland-settings animations"
        "${mod} SHIFT, B, exec, ${pkgs.scripts.toggle-hyprland-settings}/bin/toggle-hyprland-settings blur"
        "${mod} SHIFT, C, exec, pidof hypridle && ${pkgs.killall}/bin/killall hypridle && notify-send '☕ Caffeine mode enabled' || $(${pkgs.hypridle}/bin/hypridle & ${pkgs.libnotify}/bin/notify-send '☕ Caffeine mode disabled')"
        "${mod} SHIFT, M, exec, ${pkgs.scripts.toggle-hyprland-layout}/bin/toggle-hyprland-layout"
      ];
      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
      bindl = [
        "${mod}, SPACE, exec, playerctl play-pause"
        "${mod}, C, exec, playerctl next"
        "${mod}, X, exec, playerctl previous"
        ", Print, exec, ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy"
      ];
      binde = [
        "${mod} CTRL, ${left}, resizeactive, -20 0"
        "${mod} CTRL, ${right}, resizeactive, 20 0"
        "${mod} CTRL, ${up}, resizeactive, 0 -20"
        "${mod} CTRL, ${down}, resizeactive, 0 20"
      ];
      bindle = [
        ", XF86AudioRaiseVolume, exec, ${pkgs.pamixer}/bin/pamixer -i 5 --allow-boost --set-limit 200"
        ", XF86AudioLowerVolume, exec, ${pkgs.pamixer}/bin/pamixer -d 5 --allow-boost --set-limit 200"
        ", XF86AudioMute, exec, ${pkgs.pamixer}/bin/pamixer -t"
        ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 5%-"
        ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 5%+"
      ];
    };
  };

  home.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland,x11";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  home.packages = with pkgs; [
    killall
    wl-clipboard
    swww
  ];

  home.file."Pictures/wallpapers".source = inputs.wallpapers;

  home.file.".config/swappy/config".text = ''
    [Default]
    show_panel=true
    text_font=monospace
  '';
}
