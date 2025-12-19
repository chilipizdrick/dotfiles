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
    heroic = mkEnableOption "heroic game launcher";
    osu = mkEnableOption "osu-lazer";
  };

  config = mkIf cfg.enable {
    home.file."lib/glfw".source = pkgs.glfw;
    home.packages = with pkgs; let
      minecraftPkgs = [
        prismlauncher
        fabric-installer
      ];
      r2modmanPkgs = [r2modman];
      osuPkgs = [osu-lazer];
      heroicPkgs = [heroic];
    in
      (optionals cfg.minecraft minecraftPkgs)
      ++ (optionals cfg.r2modman r2modmanPkgs)
      ++ (optionals cfg.osu osuPkgs)
      ++ (optionals cfg.heroic heroicPkgs);
  };
}
