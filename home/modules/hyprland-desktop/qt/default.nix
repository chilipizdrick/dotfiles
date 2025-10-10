{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    # style.name = "breeze-dark";
    style = {
      name = "breeze";
      package = pkgs.kdePackages.breeze;
    };
  };
}
