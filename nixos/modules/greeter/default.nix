{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.noctalia-greeter;
in {
  imports = [inputs.noctalia-greeter.nixosModules.default];

  options.noctalia-greeter = {
    enable = mkEnableOption "noctalia-greeter";
    output.scale = mkOption {
      type = types.float;
      default = 1.0;
      description = "Scale factor for the greeter";
    };
    output.name = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = "Output monitor name";
    };
  };
  config = mkIf cfg.enable {
    programs.noctalia-greeter = {
      enable = true;
      settings =
        # toml
        ''
          [session]
          default = "Hyprland (uwsm-managed)"

          [user]
          default = "${config.users.users.alex.name}"

          [output]
          ${
            if cfg.output.name == null
            then ""
            else "name = ${toString cfg.output.name}"
          }
          scale = ${toString cfg.output.scale}

          [cursor]
          theme = "Bibata-Modern-Classic"
          path = "${pkgs.bibata-cursors}/share/icons"
          size = 20

          [keyboard]
          layout = "us"

          [appearance]
          scheme = "Synced"
          password_style = "random"
          hide_logo = true
        '';
    };
  };
}
