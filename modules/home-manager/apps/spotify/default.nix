{
  inputs,
  pkgs,
  ...
}: {
  programs.spicetify = let
    spicetifyPkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    spotifyPackage = pkgs.unstable.spotify;

    theme = spicetifyPkgs.themes.comfy;
    colorScheme = "Hikari";

    enabledExtensions = with spicetifyPkgs.extensions; [
      adblock
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
