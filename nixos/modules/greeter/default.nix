{
  config,
  pkgs,
  ...
}: let
  sessionCommand = "Hyprland";
in {
  security.pam.services = let
    settings = {
      enableGnomeKeyring = true;
    };
  in {
    # login = settings;
    greetd = settings;
    tuigreet = settings;
    # ly = settings;
  };

  services.greetd = let
    tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  in {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --asterisks --remember --remember-session --time --cmd ${sessionCommand}";
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
  #
  #       # Input customization
  #       asterisk = "#";
  #       blank_box = true;
  #       input_len = 34;
  #       clear_password = true;
  #
  #       clock = "%H:%M:%S"; # Show time in 24h format
  #       box_title = "Sosal?";
  #
  #       text_in_center = true; # Center align text for aesthetic
  #     };
  #   };
}
