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
    minecraft = mkEnableOption "prismlauncher and needed dependencies as well as fabric installer";
    r2modman = mkEnableOption "r2modman mod manager";
    osu = mkEnableOption "osu-lazer";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; let
      minecraftPkgs = [
        unstable.glfw-wayland-minecraft
        unstable.prismlauncher
        unstable.fabric-installer
        temurin-bin-8
        # temurin-bin-17
        # temurin-bin
      ];
      r2modmanPkgs = [unstable.r2modman];
      osuPkgs = [unstable.osu-lazer];
    in
      (optionals cfg.minecraft minecraftPkgs)
      ++ (optionals cfg.r2modman r2modmanPkgs)
      ++ (optionals cfg.osu osuPkgs);

    home.file."lib/glfw-wayland-minecraft-libglfw".source = mkIf cfg.minecraft "${pkgs.glfw-wayland-minecraft}/lib";
  };
}
