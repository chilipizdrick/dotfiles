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

    # theme = {
    #   name = "Blackout";
    #   src = "${pkgs.fetchFromGitHub {
    #     owner = "spicetify";
    #     repo = "spicetify-themes";
    #     rev = "a9ce22b3d3df303d994974b746c839c7d0907101";
    #     sha256 = "sha256-HQJrCB5kN8mE4yzC6Sc0Dh7mpttoAGIx3cvlNGnkPvc=";
    #   }}/Blackout";
    # };
    # colorScheme = "def";

    # enabledExtensions = with spicetifyPkgs.extensions; [
    #   shuffle
    # ];

    theme = spicetifyPkgs.themes.sleek;
    colorScheme = "UltraBlack";

    enabledCustomApps = with spicetifyPkgs.apps; [
      lyricsPlus
    ];
  };
}
