{
  config,
  pkgs,
  lib,
  ...
}: {
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    anchor = "top-right";
    textColor = "#ffffff";
    backgroundColor = "#000000B3";
    # backgroundColor = "#00000000";
    borderColor = "#303030";
    borderSize = 0;
    borderRadius = 10;
    font = "JetBrainsMonoNL Nerd Font";
    layer = "top";
    sort = "-time";
  };
}
