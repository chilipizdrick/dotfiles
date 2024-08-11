{
  config,
  pkgs,
  lib,
  inputs,
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
      package = inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock;
      settings = {
        general = {
          ignore_empty_input = true;
          hide_cursor = true;
        };
        background = [
          {
            # monitor = "";
            path = "$HOME/.current_wallpaper";
            blur_size = 4;
            blur_passes = 3;
            noise = 0.01;
            contrast = 1.3;
            brightness = 0.8;
            vibrancy = 0.21;
            vibrancy_darkness = 0.0;
          }
        ];
        input-field = [
          {
            # monitor = "";
            size = "250, 50";
            outline_thickness = 0;
            dots_size = 0.26;
            dots_spacing = 0.64;
            dots_center = true;
            rounding = 22;
            outer_color = "rgba(000000AA)";
            inner_color = "rgba(000000AA)";
            font_color = "rgb(ffffff)";
            fade_on_empty = true;
            placeholder_text = "";
            position = "0, 150";
            halign = "center";
            valign = "bottom";
          }
        ];
        label = [
          {
            # monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%H\") </big></b>\"";
            color = "rgb(ffffff)";
            font_size = 112;
            font_family = "Geist Mono 10";
            shadow_passes = 3;
            shadow_size = 4;
            position = "0, -100";
            halign = "center";
            valign = "top";
          }
          {
            # monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%M\") </big></b>\"";
            color = "rgb(ffffff)";
            font_size = 112;
            font_family = "Geist Mono 10";
            shadow_passes = 3;
            shadow_size = 4;
            position = "0, -240";
            halign = "center";
            valign = "top";
          }
          {
            # monitor = "";
            text = "cmd[update:18000000] echo \"<b><big> $(date +\"%A\") </big></b>\"";
            color = "rgb(ffffff)";
            font_size = 22;
            font_family = "JetBrainsMono Nerd Font 10";
            position = "0, -450";
            shadow_passes = 3;
            shadow_size = 1;
            halign = "center";
            valign = "top";
          }
          {
            # monitor = "";
            text = "cmd[update:18000000] echo \"<b> $(date +\"%d %b\") </b>\"";
            color = "rgb(ffffff)";
            font_size = 18;
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, -490";
            halign = "center";
            valign = "top";
          }
          {
            # monitor = "";
            text = ''cmd[update:250] echo "$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"'';
            color = "rgb(ffffff)";
            font_size = 15;
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, 210";
            halign = "center";
            valign = "bottom";
          }
          {
            # monitor = "";
            text = ''cmd[update:1000] [ $(playerctl status) = Playing ] && [ $(playerctl metadata | head -1 | awk '{print $1}') != firefox ] && [ $(playerctl metadata | head -1 | awk '{print $1}') != brave ] && echo "<b>$([ $(playerctl metadata | head -1 | awk '{print $1}') = spotify ] && echo ' ')$(playerctl metadata artist) - $(playerctl metadata title)</b>"'';
            color = "rgb(ffffff)";
            font_size = 18;
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, 70";
            halign = "center";
            valign = "bottom";
          }
          {
            # monitor = "";
            text = "cmd[update:18000000] echo \"<b>Feels like<big> $(curl -s 'wttr.in?format=%t' | tr -d '+') </big></b>\"";
            color = "rgb(ffffff)";
            font_size = 18;
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "0, 20";
            halign = "center";
            valign = "bottom";
          }
        ];
      };
    };
  };
}
