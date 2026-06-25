{
  withSystem,
  inputs,
  ...
}: let
  homeManagerConfiguration = {
    system ? "x86_64-linux",
    modules ? [],
  }:
    withSystem system ({
      inputs',
      self',
      pkgs,
      ...
    }:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs inputs' self';};
        modules = [./modules] ++ modules;
      });
in {
  flake.homeConfigurations = {
    "alex@atlas" = homeManagerConfiguration {
      modules = [./hosts/atlas.nix];
    };
    "alex@aurora" = homeManagerConfiguration {
      modules = [./hosts/aurora.nix];
    };
  };
}
