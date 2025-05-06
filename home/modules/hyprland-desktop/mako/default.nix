{pkgs, ...}: {
  services.mako = {
    enable = true;
    settings = {
      default-timeout = "5000";
      anchor = "top-right";
      border-size = "2";
      border-radius = "10";
      text-color = "#cdd6f4";
      background-color = "#000000B3";
      border-color = "#89b4fa";
      font = "JetBrainsMonoNL Nerd Font";
      layer = "top";
      sort = "-time";
    };
  };

  home.packages = [pkgs.libnotify];
}
