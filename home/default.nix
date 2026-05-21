{
  withSystem,
  inputs,
  ...
}: let
  homeConfiguration = {
    system ? "x86_64-linux",
    modules ? [],
  }:
    withSystem system ({
      inputs',
      self',
      pkgs,
      ...
    }: let
      extraSpecialArgs = {
        inherit inputs inputs' self';
        scripts = import ../pkgs/scripts pkgs;
      };
    in
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit modules pkgs extraSpecialArgs;
      });
in {
  flake.homeConfigurations = {
    "alex@atlas" = homeConfiguration {
      modules = [./hosts/atlas];
    };
    "alex@aurora" = homeConfiguration {
      modules = [./hosts/aurora];
    };
  };
}
