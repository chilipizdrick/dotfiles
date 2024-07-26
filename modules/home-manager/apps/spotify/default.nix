{
  inputs,
  pkgs,
  ...
}: {
  programs.spicetify = let
    spicetifyPkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  in {
    enable = true;
    # theme = spicetifyPkgs.themes.Default;
    # colorScheme = "Default";
    theme = spicetifyPkgs.themes.Sleek;
    colorScheme = "RosePine";
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
