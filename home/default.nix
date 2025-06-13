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
      pkgs,
      ...
    }: let
      extraSpecialArgs = {
        inherit inputs inputs';
        scripts = inputs'.scripts.packages;
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
