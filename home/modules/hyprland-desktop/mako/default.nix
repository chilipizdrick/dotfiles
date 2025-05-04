{pkgs, ...}: {
  services.mako = {
    enable = true;
    settings = {
      defaultTimeout = "5000";
      anchor = "top-right";
      textColor = "#cdd6f4";
      backgroundColor = "#000000B3";
      borderColor = "#89b4fa";
      borderSize = "2";
      borderRadius = "10";
      font = "JetBrainsMonoNL Nerd Font";
      layer = "top";
      sort = "-time";
    };
  };

  home.packages = [pkgs.libnotify];
}
