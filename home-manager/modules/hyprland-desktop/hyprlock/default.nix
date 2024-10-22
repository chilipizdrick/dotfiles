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
      package = pkgs.hyprlock;
      settings = {
        "$colors" = "$HOME/.config/hypr/themes/catppuccin-mocha.hypr";
        source = [
          "$colors"
        ];
        general = {
          ignore_empty_input = true;
          hide_cursor = true;
        };
        background = [
          {
            monitor = "";
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
            monitor = "";
            size = "${builtins.toString (250 * cfg.scale)}, ${builtins.toString (50 * cfg.scale)}";
            outline_thickness = 0;
            dots_size = 0.26;
            dots_spacing = 0.64;
            dots_center = true;
            rounding = builtins.floor (22 * cfg.scale);
            outer_color = "rgba(000000AA)";
            inner_color = "rgba(000000AA)";
            font_color = "$text";
            fade_on_empty = true;
            placeholder_text = "";
            position = "0, ${builtins.toString (50 * cfg.scale)}";
            halign = "center";
            valign = "bottom";
          }
        ];
        # shape = [
        #   {
        #     monitor = "";
        #     size = "${builtins.toString (cfg.scale * 480)}, ${builtins.toString (cfg.scale * 120)}";
        #     rounding = 10;
        #     border_size = 0;
        #     color = "rgba(000000AA)";
        #     reload_time = 3;
        #     reload_cmd = "~/test-script.sh";
        #     position = "0, ${builtins.toString (cfg.scale * 20)}";
        #     halign = "center";
        #     valign = "bottom";
        #   }
        # ];
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
            text = ''cmd[update:1000] $HOME/.config/hypr/scripts/get_player_metadata.sh'';
            color = "$text";
            font_size = builtins.floor (18 * cfg.scale);
            font_family = "JetBrainsMono Nerd Font 10";
            shadow_passes = 3;
            shadow_size = 1;
            position = "${builtins.toString (150 * cfg.scale)}, ${builtins.toString (50 * cfg.scale)}";
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
            reload_cmd = "$HOME/.config/hypr/scripts/load_album_cover.sh";
            position = "${builtins.toString (50 * cfg.scale)}, ${builtins.toString (50 * cfg.scale)}";
            halign = "left";
            valign = "bottom";
          }
        ];
      };
    };
  };
}
