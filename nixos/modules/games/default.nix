{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.games;
in {
  options.games = {
    enable = mkEnableOption "game related stuff";
    steam = mkEnableOption "steam";
    minecraft = mkEnableOption "minecraft";
    gamescope = mkEnableOption "gamescope";
    gamescopeExtraArgs = mkOption {
      type = types.listOf types.str;
      default = [
        "-W 2560"
        "-H 1600"
        "-r 120"
      ];
      example = [
        "-W 1920"
        "-H 1080"
        "-r 60"
      ];
      description = "Gamescope input/output screen profile args";
    };
  };

  config = mkIf cfg.enable {
    # For controllers and stuff
    hardware.uinput.enable = true;
    services.udev.packages = [
      pkgs.game-devices-udev-rules
    ];

    environment.shellAliases = mkIf cfg.minecraft {
      java8 = lib.getExe pkgs.temurin-bin-8;
      java17 = lib.getExe pkgs.temurin-bin-17;
      java21 = lib.getExe pkgs.temurin-bin-21;
    };

    programs = {
      steam = {
        enable = mkIf cfg.steam true;
        gamescopeSession.enable = mkIf cfg.gamescope true;
      };

      gamescope = {
        enable = mkIf cfg.gamescope true;
        capSysNice = true;
        args =
          [
            "--rt"
            "--adaptive-sync"
            "--expose-wayland"
          ]
          ++ cfg.gamescopeExtraArgs;
      };

      gamemode.enable = true;
    };

    environment.systemPackages = with pkgs; let
      steamPkgs = [
        mangohud
      ];
      minecraftPkgs = [
        # temurin-bin-8
        # temurin-bin-17
        temurin-bin-21
      ];
    in
      (optionals cfg.steam steamPkgs)
      ++ (optionals cfg.minecraft minecraftPkgs)
      ++ [];
  };
}
