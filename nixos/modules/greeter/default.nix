{
  pkgs,
  config,
  ...
}: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  sessionCommand = "Hyprland";
  tuiTheme = "time=lightred;input=red";
in {
  security.pam.services = let
    settings = {
      enableGnomeKeyring = true;
    };
  in {
    login = settings;
    greetd = settings;
    tuigreet = settings;
    ly = settings;
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

  # services.displayManager.ly = {
  #   enable = true;
  #   package = pkgs.ly;
  #   settings = {
  #     hide_borders = true;
  #     save = true;
  #     login_cmd = sessionCommand + ''exec "$@"'';
  #     asterisk = ">";
  #     blank_box = true;
  #     input_len = 34;
  #     clear_password = true;
  #     clock = "%H:%M:%S";
  #     box_title = "Sosal?";
  #     text_in_center = true;
  #   };
  # };
}
