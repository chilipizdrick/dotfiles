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
  };
  config = mkIf cfg.enable {
    programs.steam.enable =
      if cfg.steam
      then true
      else false;
    environment.systemPackages = with pkgs; let
      steamPkgs = [protonup-qt];
    in (
      if cfg.steam
      then steamPkgs
      else []
    );
  };
}
