{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  home.packages = with pkgs; [
    kdePackages.breeze
    kdePackages.breeze-icons
  ];
}
