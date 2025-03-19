{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicetifyPkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    spotifyPackage = pkgs.spotify;

    theme = spicetifyPkgs.themes.comfy;
    colorScheme = "Mono";

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

    enabledCustomApps = with spicetifyPkgs.apps; [
      lyricsPlus
      ncsVisualizer
    ];
  };
}
