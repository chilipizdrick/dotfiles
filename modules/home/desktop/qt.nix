{pkgs, ...}: {
  home.packages = [
    pkgs.kdePackages.breeze
    pkgs.kdePackages.breeze-icons
  ];

  qt = {
    enable = true;
    platformTheme = {
      name = "kde";
      package = pkgs.kdePackages.plasma-integration;
    };
    style = {
      name = "breeze";
      package = pkgs.kdePackages.breeze;
    };
  };
}
