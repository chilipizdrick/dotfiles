{
  config,
  lib,
  pkgs,
  ...
}: {
  # Configure locale
  i18n.defaultLocale = "en_IN";
  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "ru_RU.UTF-8";
  #   LC_IDENTIFICATION = "ru_RU.UTF-8";
  #   LC_MEASUREMENT = "ru_RU.UTF-8";
  #   LC_MONETARY = "ru_RU.UTF-8";
  #   LC_NAME = "ru_RU.UTF-8";
  #   LC_NUMERIC = "ru_RU.UTF-8";
  #   LC_PAPER = "ru_RU.UTF-8";
  #   LC_TELEPHONE = "ru_RU.UTF-8";
  #   LC_TIME = "ru_RU.UTF-8";
  # };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us,ru";
    xkb.variant = "";
    xkb.options = "grp:alt_shift_toggle";
  };
}
