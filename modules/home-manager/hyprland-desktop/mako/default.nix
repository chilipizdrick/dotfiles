{pkgs, ...}: {
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    anchor = "top-right";
    textColor = "#ffffff";
    backgroundColor = "#000000B3";
    borderColor = "#303030";
    borderSize = 0;
    borderRadius = 10;
    font = "JetBrainsMonoNL Nerd Font";
    layer = "top";
    sort = "-time";
  };
  home.packages = [pkgs.libnotify];
}