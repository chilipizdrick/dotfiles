{
  config,
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    xwayland = true;
    systemd.enable = true;
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
    config = rec {
      terminal = "${pkgs.alacritty}/bin/alacritty";

      # menu = "rofi -terminal ${terminal} -show combi -combi-modes drun#run -modes combi";
      menu = "rofi -terminal ${terminal} -show combi -combi-modes \"drun,run\" -modes combi";

      modifier = "Mod4";
      left = "h";
      down = "j";
      up = "k";
      right = "l";

      bindkeysToCode = true;

      keybindings = lib.mkOptionDefault {
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+w" = "exec kill -9 $(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .pid')";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" = "exit";
        # Screenshot functionality
        "${modifier}+Shift+s" = "exec ${pkgs.grim}/bin/grim -g \"$(slurp -d)\" - | wl-copy";
        "Print" = "exec ${pkgs.grim}/bin/grim - | wl-copy";
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+t" = "exec ${terminal} -e TERM=xterm-256color tmux -u";
        "${modifier}+d" = "exec ${menu}";
        "Alt+Space" = "exec ${menu}";
        "${modifier}+p" = "exec rofi -show p -modi p:'~/.config/waybar/rofi-power-menu.sh'";
        "${modifier}+o" = "exec ~/.config/waybar/rofi-wifi-menu.sh";

        # Switch scaling
        "${modifier}+Shift+bracketleft" = "exec ${pkgs.wlr-randr}/bin/wlr-randr --output $(${pkgs.wlr-randr}/bin/wlr-randr | awk '{print $1}') --scale 1.0";
        "${modifier}+Shift+bracketright" = "exec ${pkgs.wlr-randr}/bin/wlr-randr --output $(${pkgs.wlr-randr}/bin/wlr-randr | awk '{print $1}') --scale 2.0";

        # Brightness
        "XF86MonBrightnessDown" = "exec light -U 5";
        "XF86MonBrightnessUp" = "exec light -A 5";

        # Volume (for pipewire)
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      };

      fonts = {
        names = ["JetBrainsMono Nerd Font"];
        style = "Regular";
        size = 12.0;
      };

      gaps = {
        inner = 5;
        outer = 0;
        smartBorders = "off";
        smartGaps = false;
      };

      window = {
        titlebar = false;
        border = 0;
      };

      bars = [
        {command = "${pkgs.waybar}/bin/waybar";}
      ];

      # Set walpaper
      # output."*" = { bg = "${./backgrounds/wallpaper.jpg} fill"; };
      output."*" = {bg = "${./backgrounds/wallpaper2.png} fill";};

      input = {
        "*" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:alt_shift_toggle";
        };
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0.5";
        };
        "type:touchpad" = {
          accel_profile = "flat";
          pointer_accel = "0.35";
          tap = "enabled";
          scroll_factor = "0.25";
          natural_scroll = "enabled";
          dwt = "enabled";
        };
      };

      colors = let
        defaultColors = {
          background = "#000000";
          border = "#000000";
          childBorder = "#000000";
          indicator = "#000000";
          text = "#ffffff";
        };
      in {
        background = "#000000";
        focused = defaultColors;
        focusedInactive = defaultColors;
        placeholder = defaultColors;
        unfocused = defaultColors;
        urgent = defaultColors;
      };

      startup = let
        swaylockCommand = ''
          swaylock -f \
            --screenshots \
            --clock \
            --indicator \
            --indicator-radius 100 \
            --indicator-thickness 7 \
            --effect-blur 7x5 \
            --grace 2 \
            --fade-in 0.2
        '';
      in [
        {
          command = "--no-startup-id autotiling-rs";
          always = true;
        }
        # Setup idle behaviour
        {
          command = "${pkgs.swayidle}/bin/swayidle -w timeout 1 ${swaylockCommand}";
          always = true;
        }
      ];

      seat."seat0" = {xcursor_theme = "Bibata-Modern-Classic 20";};

      defaultWorkspace = "workspace number 1";
    };

    extraConfig = ''
      # swayfx config

      blur on
      blur_xray off
      blur_passes 2
      blur_radius 10
      blur_noise 0

      shadows on
      shadow_blur_radius 10
      shadow_color #000000AA
      shadow_inactive_color #00000077

      corner_radius 10

      layer_effects "waybar" blur on; shadows on; corner_radius 10
      layer_effects "rofi" blur on; shadows on; corner_radius 20
    '';
  };

  home.packages = with pkgs; [jq wlr-randr autotiling-rs];
}
