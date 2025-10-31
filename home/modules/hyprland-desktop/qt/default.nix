{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    # style.name = "breeze-dark";
    style = {
      name = "adwaita-dark";
      # package = pkgs.kdePackages.breeze;
    };
  };
}
