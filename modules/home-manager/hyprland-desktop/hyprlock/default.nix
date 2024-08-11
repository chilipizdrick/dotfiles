{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.hyprlock;
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
      package = pkgs.unstable.hyprlock;
      settings = {
        general = {
          ignore_empty_input = true;
          hide_cursor = true;
        };
        background = [
          {
            path = "$HOME/.current_wallpaper";
            blur_size = 4;
            blur_passes = 3;
            noise = 0.0117;
            contrast = 1.3000;
            brightness = 0.8000;
            vibrancy = 0.2100;
            vibrancy_darkness = 0.0;
          }
        ];
        input-field = [
          {
            size = "${builtins.toString (250 * cfg.scale)}, ${builtins.toString (50 * cfg.scale)}";
            outline_thickness = 0;
            dots_size = 0.26;
            dots_spacing = 0.64;
            dots_center = true;
            rounding = builtins.floor (22 * cfg.scale);
            outer_color = "rgba(000000AA)";
            inner_color = "rgba(000000AA)";
            font_color = "rgb(ffffff)";
            fade_on_empty = true;
            placeholder_text = "<i>Password...</i>";
            position = "0, ${builtins.toString (150 * cfg.scale)}";
            halign = "center";
            valign = "bottom";
          }
        ];
        label = [
          {
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%H\") </big></b>\"";
            color = "rgb(ffffff)";
            font_size = builtins.floor (112 * cfg.scale);
            font_family = "Geist Mono 10";
            shadow_passes = 3;
            shadow_size = 4;
            position = "0, ${builtins.toString (-100 * cfg.scale)}";
            halign = "center";
            valign = "top";
          }
          {
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%M\") </big></b>\"";
            color = "rgb(ffffff)";
            font_size = builtins.floor (112 * cfg.scale);
            font_family = "Geist Mono 10";
            shadow_passes = 3;
            shadow_size = 4;
            position = "0, ${builtins.toString (-240 * cfg.scale)}";
            halign = "center";
            valign = "top";
          }
          {
            text = "cmd[update:18000000] echo \"<b><big> \"$(date +'%A')\" </big></b>\"";
            color = "rgb(ffffff)";
            font_size = builtins.floor (22 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            position = "0, ${builtins.toString (-450 * cfg.scale)}";
            shadow_passes = 3;
            shadow_size = 1;
            halign = "center";
            valign = "top";
          }
          {
            text = "cmd[update:18000000] echo \"<b> \"$(date +'%d %b')\" </b>\"";
            color = "rgb(ffffff)";
            font_size = builtins.floor (18 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, ${builtins.toString (-490 * cfg.scale)}";
            halign = "center";
            valign = "top";
          }
          {
            text = ''cmd[update:250] echo "$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"'';
            color = "rgb(ffffff)";
            font_size = builtins.floor (15 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, ${builtins.toString (210 * cfg.scale)}";
            halign = "center";
            valign = "bottom";
          }
          {
            text = ''cmd[update:1000] [ $(playerctl status) = Playing ] && [ $(playerctl metadata | head -1 | awk '{print $1}') != firefox ] && [ $(playerctl metadata | head -1 | awk '{print $1}') != brave ] && echo "<b>$([ $(playerctl metadata | head -1 | awk '{print $1}') = spotify ] && echo ' ')$(playerctl metadata artist) - $(playerctl metadata title)</b>"'';
            color = "rgb(ffffff)";
            font_size = builtins.floor (18 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, ${builtins.toString (70 * cfg.scale)}";
            halign = "center";
            valign = "bottom";
          }
          {
            text = "cmd[update:18000000] echo \"<b>Feels like<big> $(curl -s 'wttr.in?format=%t' | tr -d '+') </big></b>\"";
            color = "rgb(ffffff)";
            font_size = builtins.floor (18 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, ${builtins.toString (20 * cfg.scale)}";
            halign = "center";
            valign = "bottom";
          }
        ];
      };
    };
  };
}
