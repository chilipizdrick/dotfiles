{
  pkgs,
  lib,
  inputs,
  scripts,
  inputs',
  ...
}: let
  mod = "SUPER";
  files = "${pkgs.nautilus}/bin/nautilus";
  telegram = "${pkgs.telegram-desktop}/bin/Telegram";
  spotify = "${pkgs.spotify}/bin/spotify";
  term = "${pkgs.alacritty}/bin/alacritty";
  browser = "${pkgs.xdg-utils}/bin/xdg-open \"http://\"";
  left = "H";
  down = "J";
  up = "K";
  right = "L";
  colorsConfig = "$HOME/.config/hypr/themes/catppuccin-mocha.hypr";
in {
  xdg.configFile."hypr/themes/catppuccin-mocha.hypr".source = ./catppuccin-mocha.hypr;

  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = true;
      variables = ["--all"];
    };

    settings = {
      source = [
        "${colorsConfig}"
      ];

      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NIXOS_OZONE_WL,1"
        # "BROWSER,zen"
        # "CLUTTER_BACKEND,wayland"
        # "EDITOR,nvim"
        # "GDK_BACKEND,wayland,x11"
        # "MOZ_ENABLE_WAYLAND,1"
        # "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        # "QT_QPA_PLATFORM,wayland"
        # "QT_SCALE_FACTOR,1"
        # "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        # "TERMINAL,alacritty"
        # "XDG_CURRENT_DESKTOP,Hyprland"
        # "XDG_SESSION_DESKTOP,Hyprland"
        # "XDG_SESSION_TYPE,wayland"
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
          enabled = false;
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
        kb_options = ''
          grp:alt_shift_toggle,caps:escape
        '';
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

      xwayland.force_zero_scaling = true;

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      binds = {
        workspace_back_and_forth = false;
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };

      bezier = [
        "easeOutCubic,0.215,0.61,0.355,1"
      ];

      animations = {
        enabled = true;
        animation = [
          "fadePopups,off"
          "windows,on,2,easeOutCubic"
          "windowsIn,on,2,easeOutCubic,slide,top"
          "windowsMove,on,2,default"
          "windowsOut,on,2,easeOutCubic,slide,bottom"
          "workspaces,on,2,easeOutCubic"
        ];
      };

      layerrule = [
        "animation slide,match:namespace waybar"
        "blur on,match:namespace ^(waybar|vicinae|notifications|logout_dialog|rofi)$"
        "ignore_alpha 0.5,match:namespace ^(waybar|vicinae|notifications)$"
        "blur_popups on,match:namespace ^(waybar|vicinae)$"
        "no_anim on,match:namespace ^(hyprpicker|selection|slurp|vicinae)$"
      ];

      windowrule = let
        specialWindows = [
          "\\.blueman-manager-wrapped"
          # "com.saivert.pwvucontrol"
          "xdg-desktop-portal-gtk"
          "org.pulseaudio.pavucontrol"
        ];
        specialWindowMatchRule = "match:class ^(" + (lib.strings.concatStringsSep "|" specialWindows) + ")$";
      in [
        "idle_inhibit fullscreen,match:fullscreen 1"
        "border_size 0,match:workspace w[t1],match:float 0" # Disable borders for single window workspaces

        # "Menu windows" configuration
        "float on,${specialWindowMatchRule}"
        "center on,${specialWindowMatchRule}"
        "size 50% 70%,${specialWindowMatchRule}"

        # "File dialogs" configuration
        "float on ,match:title ^(Open File|Open|Save|Save As|Export|Import|Choose File|Rename)$"
        "center on,match:title ^(Open File|Open|Save|Save As|Export|Import|Choose File|Rename)$"
        "size 50% 70%,match:title ^(Open File|Open|Save|Save As|Export|Import|Choose File|Rename)$"

        "animation popin,match:title ^(Wroomer)$"
      ];

      gesture = [
        "3,horizontal,workspace"
        "4,down,close"
        # "4,up,fullscreen"
      ];

      exec-once = [
        "${pkgs.hyprlock}/bin/hyprlock --immediate --immediate-render &" # Lock on login
        "${pkgs.hyprland}/bin/hyprctl setcursor Bibata-Modern-Classic 20"
        "${pkgs.networkmanagerapplet}/bin/nm-applet &"
      ];

      bind =
        [
          "${mod} SHIFT,Q,killactive,"
          "${mod} SHIFT,W,forcekillactive,"
          "${mod},F,fullscreen,"
          "${mod} SHIFT,F,togglefloating"
          "${mod} ALT,F,exec,hyprctl dispatch workspaceopt allfloat"
          "${mod},${left},movefocus,l"
          "${mod},${right},movefocus,r"
          "${mod},${up},movefocus,u"
          "${mod},${down},movefocus,d"
          "${mod} SHIFT,${left},movewindow,l"
          "${mod} SHIFT,${right},movewindow,r"
          "${mod} SHIFT,${up},movewindow,u"
          "${mod} SHIFT,${down},movewindow,d"
          "${mod},1,workspace,1"
          "${mod},2,workspace,2"
          "${mod},3,workspace,3"
          "${mod},4,workspace,4"
          "${mod},5,workspace,5"
          "${mod},6,workspace,6"
          "${mod},7,workspace,7"
          "${mod},8,workspace,8"
          "${mod},9,workspace,9"
          "${mod},0,workspace,10"
          "${mod} SHIFT,1,movetoworkspace,1"
          "${mod} SHIFT,2,movetoworkspace,2"
          "${mod} SHIFT,3,movetoworkspace,3"
          "${mod} SHIFT,4,movetoworkspace,4"
          "${mod} SHIFT,5,movetoworkspace,5"
          "${mod} SHIFT,6,movetoworkspace,6"
          "${mod} SHIFT,7,movetoworkspace,7"
          "${mod} SHIFT,8,movetoworkspace,8"
          "${mod} SHIFT,9,movetoworkspace,9"
          "${mod} SHIFT,0,movetoworkspace,10"
          "${mod} CTRL,1,movetoworkspacesilent,1"
          "${mod} CTRL,2,movetoworkspacesilent,2"
          "${mod} CTRL,3,movetoworkspacesilent,3"
          "${mod} CTRL,4,movetoworkspacesilent,4"
          "${mod} CTRL,5,movetoworkspacesilent,5"
          "${mod} CTRL,6,movetoworkspacesilent,6"
          "${mod} CTRL,7,movetoworkspacesilent,7"
          "${mod} CTRL,8,movetoworkspacesilent,8"
          "${mod} CTRL,9,movetoworkspacesilent,9"
          "${mod} CTRL,0,movetoworkspacesilent,10"
          "${mod},tab,workspace,m+1"
          "${mod} SHIFT,tab,workspace,m-1"
          "${mod},period,workspace,e+1"
          "${mod},comma,workspace,e-1"
          "${mod} SHIFT,U,movetoworkspace,special"
          "${mod},U,togglespecialworkspace,"

          "${mod} CTRL,W,exec,${inputs'.wroomer.packages.wroomer-wayland}/bin/wroomer -f -c"
          "${mod},W,exec,${scripts.select-wallpaper}/bin/select-wallpaper"
          "${mod} SHIFT,S,exec,${pkgs.hyprshot}/bin/hyprshot -m region -zs --clipboard-only"
          "${mod} CTRL,S,exec,mkdir ~/Pictures/screenshots -p && ${pkgs.hyprshot}/bin/hyprshot -m region -s --raw | ${pkgs.satty}/bin/satty -f - -o \"$HOME/Pictures/screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png\" --early-exit --save-after-copy --actions-on-enter save-to-clipboard --copy-command 'wl-copy' --initial-tool brush --no-window-decoration"
          "${mod} CTRL SHIFT,S,exec,${scripts.ocr}/bin/ocr"
          "${mod} SHIFT,R,exec,${scripts.record-screen}/bin/record-screen"
          "ALT,SPACE,exec,${pkgs.vicinae}/bin/vicinae toggle"
          "${mod},V,exec,${pkgs.vicinae}/bin/vicinae vicinae://extensions/vicinae/clipboard/history"
          "${mod},RETURN,exec,${term}"
          "${mod},B,exec,${browser}"
          "${mod},E,exec,${files}"
          "${mod},T,exec,${telegram}"
          "${mod},S,exec,${spotify}"
          "${mod},D,exec,discord" # For use with nixcord, thus no direct execution
          "${mod} ALT,R,exec,${scripts.reload-graphical-interface}/bin/reload-graphical-interface"
          "${mod} ALT,E,exec,${pkgs.hyprland}/bin/hyprctl dispatch exit"
          "${mod} CTRL SHIFT,L,exec,${pkgs.spotify-player}/bin/spotify_player like"
          "${mod} CTRL SHIFT,U,exec,${pkgs.spotify-player}/bin/spotify_player like --unlike"
          "${mod} ALT,L,exec,${pkgs.hyprlock}/bin/hyprlock"
          "${mod} SHIFT,P,exec,${pkgs.procps}/bin/pidof wlogout || ${pkgs.wlogout}/bin/wlogout -b 4"
          "${mod} SHIFT,A,exec,${scripts.toggle-hyprland-settings}/bin/toggle-hyprland-settings animations"
          "${mod} SHIFT,B,exec,${scripts.toggle-hyprland-settings}/bin/toggle-hyprland-settings blur"
          "${mod} SHIFT,C,exec,${scripts.toggle-caffeine-mode}/bin/toggle-caffeine-mode"
          "${mod} SHIFT,M,exec,${scripts.toggle-hyprland-layout}/bin/toggle-hyprland-layout"
          "${mod} ALT,P,exec,${scripts.spread-propaganda}/bin/spread-propaganda"
          "${mod} ALT,S,exec,${scripts.showcase}/bin/showcase"
          "${mod} ALT,C,exec,${pkgs.hyprpicker}/bin/hyprpicker | ${pkgs.wl-clipboard}/bin/wl-copy"
          "${mod} CTRL,B,exec, ${scripts.toggle-systemd-user-service}/bin/toggle-systemd-user-service waybar.service"

          # Soundpad configs
          "${mod} ALT,0,exec,${pkgs.procps}/bin/pkill hijacker2"
        ]
        ++ (map
          (num: let num_str = toString num; in "${mod} ALT,${num_str},exec,${inputs'.hijacker2.packages.hijacker2}/bin/hijacker2 ~/Music/hijacker-presets/${num_str}.mp3")
          (lib.range 1 9));

      bindm = [
        "${mod},mouse:272,movewindow"
        "${mod},mouse:273,resizewindow"
      ];
      bindl = [
        "${mod},SPACE,exec,${pkgs.playerctl}/bin/playerctl play-pause"
        "${mod},C,exec,${pkgs.playerctl}/bin/playerctl next"
        "${mod},X,exec,${pkgs.playerctl}/bin/playerctl previous"
      ];
      binde = [
        "${mod} CTRL,${left},resizeactive,-20 0"
        "${mod} CTRL,${right},resizeactive,20 0"
        "${mod} CTRL,${up},resizeactive,0 -20"
        "${mod} CTRL,${down},resizeactive,0 20"
      ];
      bindle = [
        ",XF86AudioRaiseVolume,exec,${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 2.0"
        ",XF86AudioLowerVolume,exec,${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- --limit 2.0"
        ",XF86AudioMute,exec,${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        "${mod},M,exec,${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        ",XF86MonBrightnessDown,exec,${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 5%-"
        "SHIFT,XF86MonBrightnessDown,exec,${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 0%"
        ",XF86MonBrightnessUp,exec,${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 5%+"
        "SHIFT,XF86MonBrightnessUp,exec,${pkgs.brightnessctl}/bin/brightnessctl -c backlight s 100%"
      ];
    };
  };

  services.hyprpolkitagent.enable = true;

  home.sessionVariables = {
    # BROWSER = "zen";
    # CLUTTER_BACKEND = "wayland";
    # EDITOR = "nvim";
    # GDK_BACKEND = "wayland,x11";
    # MOZ_ENABLE_WAYLAND = "1";
    # QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    # QT_QPA_PLATFORM = "wayland";
    # QT_SCALE_FACTOR = "1";
    # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # TERMINAL = "alacritty";
    # XDG_CURRENT_DESKTOP = "Hyprland";
    # XDG_SESSION_DESKTOP = "Hyprland";
    # XDG_SESSION_TYPE = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    hypridle
    hyprlock
    inputs'.wroomer.packages.wroomer-wayland
    killall
    networkmanagerapplet
    # pwvucontrol
    pavucontrol
    wl-clipboard
    xrdb
    inputs'.sl2.packages.sl2-desktop
  ];

  home.file."Pictures/wallpapers".source = inputs.wallpapers;
}
