{pkgs, ...}: {
  qt = {
    enable = true;
    # platformTheme.name = "adwaita";
    # style.name = "adwaita-dark";
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  home.packages = with pkgs.kdePackages; [
    # Install the main breeze package which contains the style and color schemes
    breeze
    breeze-icons
    # If using 'qtct' as platformTheme, install the config tools
    # qt6ct
    # qt5ct
  ];

  xdg.configFile = {
    "kdeglobals".text = ''
      [General]
      ColorScheme=BreezeDark
      # Other general settings like fonts can be added here
      # font=JetBrainsMono Nerd Font,10,-1,5,50,0,0,0,0,0

      [Icons]
      Theme=breeze-dark

      [KDE]
      lookAndFeelPackage=org.kde.breezedark.desktop
    '';
  };
}
