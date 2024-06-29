{
  config,
  lib,
  pkgs,
  ...
}: {
  # Set default session if using multiple
  # services.displayManager.defaultSession = "sway";

  # !!! Either use gdm or greetd or lightdm

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

  # services.displayManager.defaultSession = "sway";
  # services.xserver = {
  #   enable = true;
  #   displayManager = {
  #     lightdm = {
  #       enable = true;
  #       extraSeatDefaults = ''
  #         user-session = ${config.services.displayManager.defaultSession}
  #       '';
  #       greeters.mini = {
  #         enable = true;
  #         user = "alex";
  #         extraConfig = ''
  #           [greeter]
  #           show-password-label = true
  #           [greeter-theme]
  #           background-image = "/home/alex/.config/sway/backgrounds/wallpaper2.png"
  #         '';
  #       };
  #     };
  #   };
  # };
}
