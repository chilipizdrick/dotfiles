{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    config.gpu-context = "wayland";
    scripts = [pkgs.mpvScripts.mpris];
  };
}
