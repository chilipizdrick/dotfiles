{...}: {
  programs.mpv = {
    enable = true;
    config = {
      gpu-context = "wayland";
    };
  };
}
