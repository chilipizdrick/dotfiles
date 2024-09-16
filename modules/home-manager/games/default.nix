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
    enable = mkEnableOption "games related stuff";
    minecraft = mkEnableOption "prismlauncher and needed dependencies as well as fabric loader";
    r2modman = mkEnableOption "r2modman mod manager";
    osu = mkEnableOption "osu-lazer";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; let
      minecraftPkgs = [
        unstable.glfw-wayland-minecraft
        unstable.prismlauncher
        unstable.fabric-installer
        # temurin-bin
        # temurin-bin-17
        temurin-bin-8
      ];
      r2modmanPkgs = [unstable.r2modman];
      osuPkgs = [unstable.osu-lazer];
    in
      (
        if cfg.minecraft
        then minecraftPkgs
        else []
      )
      ++ (
        if cfg.r2modman
        then r2modmanPkgs
        else []
      )
      ++ (
        if cfg.osu
        then osuPkgs
        else []
      )
      ++ [
        mangohud
        gamemode
      ];

    home.file."lib/glfw-wayland-minecraft-libglfw".source = mkIf cfg.minecraft "${pkgs.glfw-wayland-minecraft}/lib";
  };
}
