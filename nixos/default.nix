{
  withSystem,
  inputs,
  ...
}: let
  nixosConfiguration = {
    system ? "x86_64-linux",
    modules ? [],
  }:
    withSystem system ({
      inputs',
      self',
      ...
    }: let
      specialArgs = {
        inherit inputs inputs' self';
      };
    in
      inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [./modules] ++ modules;
      });
in {
  flake.nixosConfigurations = {
    atlas = nixosConfiguration {modules = [./hosts/atlas];};
    aurora = nixosConfiguration {modules = [./hosts/aurora];};
  };
}
