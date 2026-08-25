{
  config,
  pkgs,
  ...
}: {
  services.displayManager.noctalia-greeter = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    settings = {
      session.default = "Hyprland (uwsm-managed)";
      user.default = config.users.users.alex.name;
      keyboard.layout = "us";
      appearance = {
        scheme = "Synced";
        password_style = "random";
        hide_logo = true;
      };
    };
  };
}
