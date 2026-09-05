{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    package = pkgs.mpv-unwrapped;
    config = {
      gpu-context = "wayland";
    };
  };
}
