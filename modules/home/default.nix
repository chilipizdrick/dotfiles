{
  services.udiskie.enable = true;
  services.mpris-proxy.enable = true;

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "26.05";
}
