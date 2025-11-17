{
  inputs,
  inputs',
  pkgs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    spotify-player
  ];

  programs.spicetify = let
    spicetifyPkgs = inputs'.spicetify-nix.legacyPackages;
  in {
    enable = true;

    theme = spicetifyPkgs.themes.sleek;
    colorScheme = "UltraBlack";

    enabledCustomApps = with spicetifyPkgs.apps; [
      lyricsPlus
    ];
  };
}
