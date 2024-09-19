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
    programs.steam = {
      enable = mkIf cfg.steam true;
      package = pkgs.steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            libkrb5
            keyutils
          ];
      };
    };
    environment.systemPackages = with pkgs; let
      steamPkgs = [
        /*
        protonup-qt
        */
        gamemode
        mangohud
        unstable.gamescope
      ];
    in
      (optionals cfg.steam steamPkgs) ++ [];
  };
}
