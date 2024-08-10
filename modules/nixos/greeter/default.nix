{pkgs, ...}: {
  security.pam.services.greetd = {enableGnomeKeyring = true;};
  services.greetd = let
    tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
    sessionCommand = "Hyprland";
  in {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --asterisks --remember --remember-session --time --cmd ${sessionCommand}";
        user = "greeter";
      };
      initial_session = {
        command = sessionCommand;
        user = "alex";
      };
    };
  };
}
