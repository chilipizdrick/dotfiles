{pkgs, ...}: {
  services.mako = {
    enable = true;
    package = pkgs.mako;
    defaultTimeout = 5000;
    anchor = "top-right";
    # textColor = "#ffffff";
    textColor = "#cdd6f4"; # Catpuccin mocha text color
    backgroundColor = "#000000B3";
    # borderColor = "#ffffff";
    borderColor = "#89b4fa"; # Catpuccin mocha blue color
    borderSize = 2;
    borderRadius = 10;
    font = "JetBrainsMonoNL Nerd Font";
    layer = "top";
    sort = "-time";
  };
  home.packages = [pkgs.libnotify];
}
