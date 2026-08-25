{pkgs, ...}: {
  programs.noctalia = {
    enable = true;
    settings = ./config.toml;
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    gpu-screen-recorder
  ];
}
