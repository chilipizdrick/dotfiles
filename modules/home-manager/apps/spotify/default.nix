{
  inputs,
  pkgs,
  ...
}: {
  programs.spicetify = let
    spicetifyPkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
    # hazyTheme = pkgs.fetchgit {
    #   url = "https://github.com/Astromations/Hazy";
    #   rev = "3a1fa2fdbf685bf74c510a98c1f2d415929aa3da";
    #   sha256 = "sha256-jYLtpd53u5lROxlaDfbyqO0rZvrTMQ2An4MC3wj9FkA=";
    # };
  in {
    enable = true;

    theme = spicetifyPkgs.themes.Default;
    # colorScheme = "Default";

    colorScheme = "custom";

    customColorScheme = {
      text = "ebbcba";
      subtext = "F0F0F0";
      sidebar-text = "e0def4";
      main = "191724";
      sidebar = "2a2837";
      player = "191724";
      card = "191724";
      shadow = "1f1d2e";
      selected-row = "797979";
      button = "31748f";
      button-active = "31748f";
      button-disabled = "555169";
      tab-active = "ebbcba";
      notification = "1db954";
      notification-error = "eb6f92";
      misc = "6e6a86";
    };

    # theme = spicetifyPkgs.themes.DefaultDynamic;
    # colorScheme = "Default";

    # theme = spicetifyPkgs.themes.Sleek;
    # colorScheme = "RosePine";

    # theme = {
    #   name = "Hazy";
    #   src = hazyTheme;
    #   # requiredExtensions = [
    #   #   {
    #   #     filename = "hazy.js";
    #   #     src = "${hazyTheme}";
    #   #   }
    #   # ];
    #   appendName = false;
    #   injectCss = true;
    #   replaceColors = true;
    #   overwriteAssets = true;
    #   sidebarConfig = false;
    #   # injectThemeJs = true;
    # };

    enabledExtensions = with spicetifyPkgs.extensions; [
      adblock
      fullAppDisplay
      shuffle
      fullAlbumDate
      showQueueDuration
      history
      hidePodcasts
      playNext
      volumePercentage
    ];
  };
}
