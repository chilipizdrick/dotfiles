{
  withSystem,
  inputs,
  ...
}: let
  nixosConfiguration = {modules ? []}:
    withSystem "x86_64-linux" ({inputs', ...}: let
      specialArgs = {inherit inputs inputs';};
    in
      inputs.nixpkgs.lib.nixosSystem {inherit modules specialArgs;});
in {
  flake.nixosConfigurations = {
    atlas = nixosConfiguration {modules = [./hosts/atlas];};
    aurora = nixosConfiguration {modules = [./hosts/aurora];};
  };
}
