{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.breeze
    kdePackages.breeze-icons
  ];

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style = {
      name = "breeze";
      package = pkgs.kdePackages.breeze;
    };
  };
}
