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
      pkgs,
      ...
    }: let
      specialArgs = {
        inherit inputs inputs';
        scripts = import ../pkgs/scripts pkgs;
      };
    in
      inputs.nixpkgs.lib.nixosSystem {inherit modules specialArgs;});
in {
  flake.nixosConfigurations = {
    atlas = nixosConfiguration {modules = [./hosts/atlas];};
    aurora = nixosConfiguration {modules = [./hosts/aurora];};
  };
}
