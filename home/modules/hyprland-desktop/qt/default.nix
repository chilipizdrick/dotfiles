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

  # xdg.configFile."kdeglobals".text = ''
  #     [General]
  #     ColorScheme=BreezeDark
  #     Name=Breeze Dark
  #
  #     [Icons]
  #     Theme=breeze-dark
  #
  #     ${builtins.readFile "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors"}
  #   # '';
}
