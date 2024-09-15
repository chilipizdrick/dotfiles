{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # package = pkgs.hyprland;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$wallDIR" = "$HOME/Pictures/wallpapers";
      "$mainMod" = "SUPER";
      "$scripts" = "$HOME/.config/hypr/scripts";
      "$files" = "${pkgs.gnome.nautilus}/bin/nautilus";
      # "$files" = "env EDITOR=nvim VISUAL=nvim alacritty -e 'ranger'";
      "$term" = "${pkgs.alacritty}/bin/alacritty";
      "$left" = "H";
      "$right" = "L";
      "$up" = "K";
      "$down" = "J";
      # "$colors" = "$HOME/.config/hypr/themes/wallust.hypr";
      "$colors" = "$HOME/.config/hypr/themes/catppuccin-mocha.hypr";

      source = [
        "$colors"
      ];

      # "debug:disable_logs" = false;
      # "debug:enable_stdout_logs" = true;
      # "debug:error_limit" = 100;

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
        allow_tearing = true;
        # sensitivity = 1.00;
        # apply_sens_to_raw = false;
        gaps_in = "5,5,0,0";
        gaps_out = 5;
        border_size = 2;
        # "col.active_border" = "$color6";
        # "col.inactive_border" = "$background";
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
          scroll_factor = 0.25;
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
        vrr = 2;
        enable_swallow = true;
        focus_on_activate = false;
        swallow_regex = "^(alacritty|kitty|mpv|imv)$";
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
        # "blur,class:^(swww)$"
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

        # "opacity 0.8,title:^(Spotify)(.*)$"
      ];

      windowrulev2 = [
        "idleinhibit fullscreen, fullscreen:1"
        "opacity 0.95 0.75,title:^(Picture-in-Picture)$ # for opacity: [focus num] [bg num]"
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
        "hyprlock --immediate --immediate-render &" # Lock on login
        "hypridle &"
        "waybar &"
        "swww-daemon &"
        "spoofdpi -port 8081 -dns-addr 1.1.1.1"
        "hyprctl setcursor Bibata-Modern-Classic 20"
        "nm-applet &"
        "otd-daemon &"
      ];

      bind = [
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod SHIFT, W, exec, kill -9 $(hyprctl activewindow | grep 'pid:' | awk '{print $2}')"
        "$mainMod, F, fullscreen,"
        "$mainMod SHIFT, F, togglefloating,"
        "$mainMod ALT, F, exec, hyprctl dispatch workspaceopt allfloat"
        "$mainMod, $left, movefocus, l"
        "$mainMod, $right, movefocus, r"
        "$mainMod, $up, movefocus, u"
        "$mainMod, $down, movefocus, d"
        "$mainMod CTRL, $left, movewindow, l"
        "$mainMod CTRL, $right, movewindow, r"
        "$mainMod CTRL, $up, movewindow, u"
        "$mainMod CTRL, $down, movewindow, d"
        "$mainMod, G, togglegroup"
        "ALT, tab, changegroupactive  #change focus to another window  "
        "$mainMod SHIFT, code:10, movetoworkspace, 1"
        "$mainMod SHIFT, code:11, movetoworkspace, 2"
        "$mainMod SHIFT, code:12, movetoworkspace, 3"
        "$mainMod SHIFT, code:13, movetoworkspace, 4"
        "$mainMod SHIFT, code:14, movetoworkspace, 5"
        "$mainMod SHIFT, code:15, movetoworkspace, 6"
        "$mainMod SHIFT, code:16, movetoworkspace, 7"
        "$mainMod SHIFT, code:17, movetoworkspace, 8"
        "$mainMod SHIFT, code:18, movetoworkspace, 9"
        "$mainMod SHIFT, code:19, movetoworkspace, 10"
        "$mainMod SHIFT, bracketleft, movetoworkspace, -1 # brackets [ or ]"
        "$mainMod SHIFT, bracketright, movetoworkspace, +1"
        "$mainMod CTRL, code:10, movetoworkspacesilent, 1"
        "$mainMod CTRL, code:11, movetoworkspacesilent, 2"
        "$mainMod CTRL, code:12, movetoworkspacesilent, 3"
        "$mainMod CTRL, code:13, movetoworkspacesilent, 4"
        "$mainMod CTRL, code:14, movetoworkspacesilent, 5"
        "$mainMod CTRL, code:15, movetoworkspacesilent, 6"
        "$mainMod CTRL, code:16, movetoworkspacesilent, 7"
        "$mainMod CTRL, code:17, movetoworkspacesilent, 8"
        "$mainMod CTRL, code:18, movetoworkspacesilent, 9"
        "$mainMod CTRL, code:19, movetoworkspacesilent, 10"
        "$mainMod CTRL, bracketleft, movetoworkspacesilent, -1 # brackets [ or ]"
        "$mainMod CTRL, bracketright, movetoworkspacesilent, +1"
        "$mainMod, code:10, workspace, 1"
        "$mainMod, code:11, workspace, 2"
        "$mainMod, code:12, workspace, 3"
        "$mainMod, code:13, workspace, 4"
        "$mainMod, code:14, workspace, 5"
        "$mainMod, code:15, workspace, 6"
        "$mainMod, code:16, workspace, 7"
        "$mainMod, code:17, workspace, 8"
        "$mainMod, code:18, workspace, 9"
        "$mainMod, code:19, workspace, 10"
        "$mainMod, tab, workspace, m+1"
        "$mainMod SHIFT, tab, workspace, m-1"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, period, workspace, e+1"
        "$mainMod, comma, workspace, e-1"
        "$mainMod SHIFT, U, movetoworkspace, special"
        "$mainMod, U, togglespecialworkspace,"
        "$mainMod, W, exec, $scripts/select_wallpaper.sh"
        ", Print, exec, grim - | wl-copy"
        "$mainMod SHIFT, S, exec, grim -g \"$(slurp -d)\" - | convert - -shave 1x1 PNG:- | wl-copy"
        "$mainMod CTRL, S, exec, grim -g \"$(slurp -d)\" - | convert - -shave 1x1 PNG:- | swappy -f -"
        "$mainMod, D, exec, rofi -show drun -modi drun,calc"
        "ALT, SPACE, exec, rofi -show drun -modi drun,calc"
        "$mainMod, Return, exec, $term"
        "$mainMod, E, exec, $files"
        "$mainMod ALT, R, exec, $scripts/refresh.sh # Refresh waybar, rofi"
        "$mainMod, B, exec, killall -SIGUSR1 waybar # Toggle hide/show waybar "
        "CTRL ALT, Delete, exec, hyprctl dispatch exit"
        "$mainMod ALT, C, exec, hyprctl reload # Reload config"
        "$mainMod SHIFT, E, exec, hyprctl dispatch exit"
        "$mainMod ALT, L, exec, hyprlock"
        "$mainMod SHIFT, P, exec, pidof wlogout || wlogout -b 4"
        "$mainMod SHIFT, A, exec, $scripts/toggle.sh animations"
        "$mainMod SHIFT, B, exec, $scripts/toggle.sh blur"
        "$mainMod SHIFT, C, exec, pidof hypridle && killall hypridle && notify-send '☕ Caffeine mode enabled' || $(hypridle & notify-send '☕ Caffeine mode disabled')"
        "$mainMod SHIFT, M, exec, $scripts/switch_layout.sh"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindl = [
        "$mainMod, SPACE, exec, playerctl play-pause"
        "$mainMod, C, exec, playerctl next"
        "$mainMod, X, exec, playerctl previous"
      ];
      bindle = [
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 --allow-boost --set-limit 200"
        ", XF86AudioLowerVolume, exec, pamixer -d 5 --allow-boost --set-limit 200"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86MonBrightnessDown, exec, brightnessctl -c backlight s 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl -c backlight s 5%+"
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
    wl-clipboard # Clipboard functionality on wayland
    pamixer # Pulseauido command line mixer
    brightnessctl # Read and controll device brightness
    libnotify # For sending custom notifications
    grim # Screenshot functionality
    slurp # Screenshot functionality
    swappy # Simple image editor for screnshots
    imagemagick # Image manipulation
    killall # Self explainatory
    networkmanagerapplet # Easy network connection management
    swww # Fancy wallpaper daemon
    spoofdpi # DPI workaround for russian ISPs
  ];

  home.file.".config/hypr/scripts".source = ./config/scripts;
  home.file."Pictures/wallpapers".source = inputs.wallpapers;

  home.file.".config/swappy/config".text = ''
    [Default]
    show_panel=true
    text_font=monospace
  '';

  home.file.".config/hypr/themes/catppuccin-mocha.hypr".text = ''
    $rosewater = rgb(f5e0dc)
    $rosewaterAlpha = f5e0dc

    $flamingo = rgb(f2cdcd)
    $flamingoAlpha = f2cdcd

    $pink = rgb(f5c2e7)
    $pinkAlpha = f5c2e7

    $mauve = rgb(cba6f7)
    $mauveAlpha = cba6f7

    $red = rgb(f38ba8)
    $redAlpha = f38ba8

    $maroon = rgb(eba0ac)
    $maroonAlpha = eba0ac

    $peach = rgb(fab387)
    $peachAlpha = fab387

    $yellow = rgb(f9e2af)
    $yellowAlpha = f9e2af

    $green = rgb(a6e3a1)
    $greenAlpha = a6e3a1

    $teal = rgb(94e2d5)
    $tealAlpha = 94e2d5

    $sky = rgb(89dceb)
    $skyAlpha = 89dceb

    $sapphire = rgb(74c7ec)
    $sapphireAlpha = 74c7ec

    $blue = rgb(89b4fa)
    $blueAlpha = 89b4fa

    $lavender = rgb(b4befe)
    $lavenderAlpha = b4befe

    $text = rgb(cdd6f4)
    $textAlpha = cdd6f4

    $subtext1 = rgb(bac2de)
    $subtext1Alpha = bac2de

    $subtext0 = rgb(a6adc8)
    $subtext0Alpha = a6adc8

    $overlay2 = rgb(9399b2)
    $overlay2Alpha = 9399b2

    $overlay1 = rgb(7f849c)
    $overlay1Alpha = 7f849c

    $overlay0 = rgb(6c7086)
    $overlay0Alpha = 6c7086

    $surface2 = rgb(585b70)
    $surface2Alpha = 585b70

    $surface1 = rgb(45475a)
    $surface1Alpha = 45475a

    $surface0 = rgb(313244)
    $surface0Alpha = 313244

    $base = rgb(1e1e2e)
    $baseAlpha = 1e1e2e

    $mantle = rgb(181825)
    $mantleAlpha = 181825

    $crust = rgb(11111b)
    $crustAlpha = 11111b
  '';
}
