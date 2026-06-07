{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
    # iconTheme = {
    #   name = "breeze-dark";
    #
    # };
  };

  xdg.configFile."kdeglobals".text = ''
    [General]
    ColorScheme=BreezeDark
    Name=Breeze Dark

    [Icons]
    Theme=breeze-dark

    ${builtins.readFile "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors"}
  '';
}
