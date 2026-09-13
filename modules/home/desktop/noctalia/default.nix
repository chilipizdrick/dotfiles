{pkgs, ...}: {
  programs.noctalia = {
    enable = true;
    settings = fromTOML (builtins.readFile ./config.toml);
    systemd.enable = true;
  };

  home.packages = with pkgs; [gpu-screen-recorder];
}
