{
  config,
  lib,
  pkgs,
  ...
}: {
  # Set scaling in gdm to 2
  # programs.dconf.profiles.gdm.databases = [
  #   {
  #     settings."org/gnome/desktop/interface".scaling-factor = lib.gvariant.mkUint32 2;
  #   }
  # ];
  # services.xserver.displayManager.gdm = {
  #   enable = true;
  #   wayland = true;
  #   banner = ''
  #     Nixosing?
  #   '';
  # };

  security.pam.services.greetd = {enableGnomeKeyring = true;};
  services.greetd = let
    tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
    sessionCommand = "${pkgs.hyprland}/bin/Hyprland";
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
