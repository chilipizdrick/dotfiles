{
  inputs,
  pkgs,
  ...
}: {
  programs.spicetify = let
    # spicetifyPkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
    spicetifyPkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    # hazyTheme = pkgs.fetchgit {
    #   url = "https://github.com/Astromations/Hazy";
    #   rev = "3a1fa2fdbf685bf74c510a98c1f2d415929aa3da";
    #   sha256 = "sha256-jYLtpd53u5lROxlaDfbyqO0rZvrTMQ2An4MC3wj9FkA=";
    # };
  in {
    enable = true;

    # theme = spicetifyPkgs.themes.default;
    # colorScheme = "Default";

    # theme = spicetifyPkgs.themes.dribbblish;
    # colorScheme = "Nord-Dark";

    theme = spicetifyPkgs.themes.comfy;
    colorScheme = "Hikari";

    enabledExtensions = with spicetifyPkgs.extensions; [
      adblock
      # fullAppDisplay
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
