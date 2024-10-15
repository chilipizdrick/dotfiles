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
    spotifyPackage = pkgs.unstable.spotify;

    theme = spicetifyPkgs.themes.comfy;
    colorScheme = "Hikari";
    # theme = spicetifyPkgs.themes.catppuccin;
    # colorScheme = "Mocha";

    enabledExtensions = with spicetifyPkgs.extensions; [
      adblock
      shuffle
      fullAlbumDate
      showQueueDuration
      history
      hidePodcasts
      playNext
      volumePercentage
      randomBadToTheBoneRiff
    ];
  };
}
