{
  home-manager,
  nixpkgs,
  extraSpecialArgs,
  ...
}: let
  homeConfiguration = modules:
    home-manager.lib.homeManagerConfiguration {
      inherit modules extraSpecialArgs;
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    };
in {
  "alex@atlas" = homeConfiguration [./hosts/atlas/home.nix];
  "alex@aurora" = homeConfiguration [./hosts/aurora/home.nix];
}
