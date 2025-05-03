{
  nixpkgs,
  specialArgs,
  ...
}: let
  nixosConfiguration = modules:
    nixpkgs.lib.nixosSystem {
      inherit modules specialArgs;
    };
in {
  atlas = nixosConfiguration [./hosts/atlas/configuration.nix];
  aurora = nixosConfiguration [./hosts/aurora/configuration.nix];
}
