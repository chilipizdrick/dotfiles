{...}: {
  programs.vicinae = {
    enable = true;

    settings = {
      close_on_focus_loss = false;
      theme.dark.name = "vicinae-dark";
      launcher_window.opacity = 0.8;
      pop_to_root_on_close = true;
      font = {
        normal = {
          size = 10.5;
          family = "Inter";
        };
      };
    };

    systemd.enable = true;
  };
}
