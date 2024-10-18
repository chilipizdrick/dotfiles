{pkgs, ...}: {
  home.packages = with pkgs; [wallust];
  home.file.".config/wallust/wallust.toml".source = ./config/wallust.toml;
  home.file.".config/wallust/templates".source = ./config/templates;
}
