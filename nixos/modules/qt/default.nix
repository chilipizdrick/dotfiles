{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "kde";
    style = "breeze";
  };

  environment.systemPackages = with pkgs; [
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.qqc2-breeze-style
  ];
}
