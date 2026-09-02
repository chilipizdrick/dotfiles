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
      cursor.size = 20;
      appearance = {
        scheme = "Synced";
        password_style = "random";
        hide_logo = true;
      };
    };
  };

  services.greetd.settings.initial_session = {
    user = config.users.users.alex.name;
    command = "${pkgs.coreutils}/bin/env INITIAL_HYPRLAND_SESSION=1 ${pkgs.uwsm}/bin/uwsm start hyprland.desktop";
  };
}
