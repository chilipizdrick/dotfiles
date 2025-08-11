{
  pkgs,
  config,
  ...
}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  sessionCommand = "Hyprland";
  tuiTheme = "time=lightred;input=red";
in {
  security.pam.services = {
    login = {};
    greetd = {};
    tuigreet = {};
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''${tuigreet} --asterisks --asterisks-char "*" --theme '${tuiTheme}' --time --remember --remember-session --cmd ${sessionCommand}'';
        user = "greeter";
      };
      initial_session = {
        command = sessionCommand;
        user = config.users.users.alex.name;
      };
    };
  };
}
