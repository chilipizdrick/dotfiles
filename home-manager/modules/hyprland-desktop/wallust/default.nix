{pkgs, ...}: {
  home.packages = with pkgs; [unstable.wallust];
  home.file.".config/wallust/wallust.toml".source = ./config/wallust.toml;
  home.file.".config/wallust/templates".source = ./config/templates;
}
