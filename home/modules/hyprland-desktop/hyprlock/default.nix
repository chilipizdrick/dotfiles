{
  config,
  pkgs,
  lib,
  inputs',
  ...
}:
with lib; let
  cfg = config.hyprlock;
  colorsConfig = "$HOME/.config/hypr/themes/catppuccin-mocha.hypr";
in {
  options.hyprlock = {
    enable = mkEnableOption "Hyprlock locker";
    scale = mkOption {
      type = types.float;
      default = 1.0;
      example = 2.0;
      description = "Monitor scale";
    };
  };
  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      package = pkgs.hyprlock;
      settings = {
        source = [
          "${colorsConfig}"
        ];
        general = {
          ignore_empty_input = true;
          hide_cursor = true;
          no_fade_in = true;
        };
        background = [
          {
            monitor = "";
            path = "$HOME/.current_wallpaper";
            blur_size = 4;
            blur_passes = 3;
            noise = 0;
            contrast = 1.3;
            brightness = 0.9;
            vibrancy = 0.21;
            vibrancy_darkness = 0.0;
          }
        ];
        input-field = [
          {
            monitor = "";
            size = "${builtins.toString (250 * cfg.scale)}, ${builtins.toString (50 * cfg.scale)}";
            halign = "center";
            valign = "bottom";
            position = "0, ${builtins.toString (50 * cfg.scale)}";
            outline_thickness = 0;
            dots_size = 0.26;
            dots_spacing = 0.64;
            dots_center = true;
            rounding = builtins.floor (22 * cfg.scale);
            font_color = "$text";
            placeholder_text = "";
            outer_color = "rgba(0, 0, 0, 0.7)";
            inner_color = "rgba(0, 0, 0, 0.7)";
            check_color = "$blue";
            fail_color = "$red";
          }
        ];
        label = [
          {
            monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%H\") </big></b>\"";
            color = "$text";
            font_size = builtins.floor (112 * cfg.scale);
            font_family = "Geist Mono 10";
            shadow_passes = 3;
            shadow_size = 4;
            position = "0, ${builtins.toString (-100 * cfg.scale)}";
            halign = "center";
            valign = "top";
          }
          {
            monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%M\") </big></b>\"";
            color = "$text";
            font_size = builtins.floor (112 * cfg.scale);
            font_family = "Geist Mono 10";
            shadow_passes = 3;
            shadow_size = 4;
            position = "0, ${builtins.toString (-240 * cfg.scale)}";
            halign = "center";
            valign = "top";
          }
          {
            monitor = "";
            text = "cmd[update:18000000] echo \"<b><big> $(date +\"%A\") </big></b>\"";
            color = "$text";
            font_size = builtins.floor (22 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            position = "0, ${builtins.toString (-450 * cfg.scale)}";
            shadow_passes = 3;
            shadow_size = 1;
            halign = "center";
            valign = "top";
          }
          {
            monitor = "";
            text = "cmd[update:18000000] echo \"<b> $(date +\"%d %b\") </b>\"";
            color = "$text";
            font_size = builtins.floor (18 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, ${builtins.toString (-490 * cfg.scale)}";
            halign = "center";
            valign = "top";
          }
          {
            monitor = "";
            text = ''cmd[update:250] echo "$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"'';
            color = "$text";
            font_size = builtins.floor (15 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, ${builtins.toString (110 * cfg.scale)}";
            halign = "center";
            valign = "bottom";
          }
          {
            monitor = "";
            text = ''cmd[update:1000] ${inputs'.scripts.packages.get-player-metadata}/bin/get-player-metadata'';
            color = "$text";
            font_size = builtins.floor (18 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "${builtins.toString (160 * cfg.scale)}, ${builtins.toString (50 * cfg.scale)}";
            halign = "left";
            valign = "bottom";
          }
        ];
        image = [
          {
            monitor = "";
            size = builtins.floor (75 * cfg.scale);
            rounding = 10;
            border_size = 0;
            reload_time = 1;
            reload_cmd = "${inputs'.scripts.packages.load-album-cover}/bin/load-album-cover";
            position = "${builtins.toString (50 * cfg.scale)}, ${builtins.toString (50 * cfg.scale)}";
            halign = "left";
            valign = "bottom";
          }
        ];
      };
    };
  };
}
