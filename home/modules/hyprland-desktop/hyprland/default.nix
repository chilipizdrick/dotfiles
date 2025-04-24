{
  pkgs,
  inputs,
  scripts,
  ...
}: let
  mod = "SUPER";
  guiFiles = "${pkgs.nautilus}/bin/nautilus";
  files = "${pkgs.ghostty}/bin/ghostty -e \"${pkgs.yazi}/bin/yazi\"";
  telegram = "${pkgs.telegram-desktop}/bin/telegram-desktop";
  term = "${pkgs.ghostty}/bin/ghostty";
  term2 = "${pkgs.alacritty}/bin/alacritty";
  browser = "xdg-open \"http://\"";
  left = "H";
  right = "L";
  up = "K";
  down = "J";
  colorsConfig = "$HOME/.config/hypr/themes/catppuccin-mocha.hypr";
in {
  xdg.configFile."hypr/themes/catppuccin-mocha.hypr".source = ./catppuccin-mocha.hypr;

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

      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland"
        "QT_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "NIXOS_OZONE_WL,1"
        "MOZ_ENABLE_WAYLAND,1"
        "EDITOR,nvim"
      ];

      monitor = [
        ",preferred,auto,auto"
      ];

      general = {
        gaps_in = "5,5,0,0";
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "$text";
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

        shadow = {
          enabled = true;
          range = 300;
          render_power = 5;
          color = "rgba(1a1a1aaf)";
          offset = "20 20";
          scale = 0.9;
        };

        blur = {
          enabled = true;
          size = 4;
          passes = 4;
          vibrancy = 0.1696;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
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
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        key_press_enables_dpms = true;
        vrr = 1;
        initial_workspace_tracking = 1;
        font_family = "monospace";
        enable_anr_dialog = false;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
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
        "ignorealpha 0.79,waybar"
        "animation slide,waybar"
      ];

      windowrule = [
        "float,class:.blueman-manager-wrapped"
        "float,class:org.pulseaudio.pavucontrol$"
        "float,class:yad"
        "idleinhibit fullscreen, fullscreen:1"
        "noborder, onworkspace:w[t1]" # Disable borders for single window workspaces
      ];

      exec-once = [
        "hyprlock --immediate --immediate-render &" # Lock on login
        "hyprctl setcursor Bibata-Modern-Classic 20"
        "hypridle &"
        "${pkgs.networkmanagerapplet}/bin/nm-applet &"
        "swww-daemon &"
        "waybar &"
        "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
      ];

      bind = [
        "${mod} SHIFT, Q, killactive,"
        "${mod} SHIFT, W, forcekillactive,"
        "${mod}, F, fullscreen,"
        "${mod} SHIFT, F, togglefloating"
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
        "${mod}, W, exec, ${scripts.select-wallpaper}/bin/select-wallpaper"
        "${mod} SHIFT, S, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.wl-clipboard}/bin/wl-copy"
        "${mod} CTRL, S, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.swappy}/bin/swappy -f -"
        "${mod}, D, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun -modi drun,calc"
        "ALT, SPACE, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun -modi drun,calc"
        "${mod}, Return, exec, ${term}"
        "${mod} SHIFT, Return, exec, ${term2}"
        "${mod}, B, exec, ${browser}"
        "${mod}, E, exec, ${files}"
        "${mod} SHIFT, E, exec, ${guiFiles}"
        "${mod}, T, exec, ${telegram}"
        "${mod} ALT, R, exec, ${scripts.reload-graphical-interface}/bin/reload-graphical-interface"
        "CTRL ALT, Delete, exec, hyprctl dispatch exit"
        "${mod} ALT, E, exec, hyprctl dispatch exit"
        "${mod} ALT, L, exec, hyprlock"
        "${mod} SHIFT, P, exec, pidof wlogout || ${pkgs.wlogout}/bin/wlogout -b 4"
        "${mod} SHIFT, A, exec, ${scripts.toggle-hyprland-settings}/bin/toggle-hyprland-settings animations"
        "${mod} SHIFT, B, exec, ${scripts.toggle-hyprland-settings}/bin/toggle-hyprland-settings blur"
        "${mod} SHIFT, C, exec, pidof hypridle && ${pkgs.killall}/bin/killall hypridle && notify-send '☕ Caffeine mode enabled' || $(${pkgs.hypridle}/bin/hypridle & ${pkgs.libnotify}/bin/notify-send '☕ Caffeine mode disabled')"
        "${mod} SHIFT, M, exec, ${scripts.toggle-hyprland-layout}/bin/toggle-hyprland-layout"
        "${mod} ALT, P, exec, ${scripts.spread-propaganda}/bin/spread-propaganda"
        "${mod} ALT, S, exec, ${scripts.showcase}/bin/showcase"
        "${mod} ALT, C, exec, ${pkgs.hyprpicker}/bin/hyprpicker | ${pkgs.wl-clipboard}/bin/wl-copy"
        "${mod}, N, exec, swaync-client -t"
      ];
      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
      bindl = [
        "${mod}, SPACE, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        "${mod}, C, exec, ${pkgs.playerctl}/bin/playerctl next"
        "${mod}, X, exec, ${pkgs.playerctl}/bin/playerctl previous"
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
        "SHIFT, XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 0%"
        ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 5%+"
        "SHIFT, XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 100%"
      ];
    };
  };

  services.hyprpolkitagent.enable = true;

  home.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  home.packages = with pkgs; [
    hyprlock
    hypridle
    killall
    wl-clipboard
    swww
    opentabletdriver
  ];

  home.file."Pictures/wallpapers".source = inputs.wallpapers;

  xdg.configFile."swappy/config".text = ''
    [Default]
    show_panel=true
    text_font=monospace
  '';
}
