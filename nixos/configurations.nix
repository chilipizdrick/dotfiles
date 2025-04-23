{
  nixpkgs,
  specialArgs,
  ...
}: {
  "atlas" = nixpkgs.lib.nixosSystem {
    inherit specialArgs;
    modules = [
      ./hosts/atlas/configuration.nix
    ];
  };
  "aurora" = nixpkgs.lib.nixosSystem {
    inherit specialArgs;
    modules = [
      ./hosts/aurora/configuration.nix
    ];
  };
}
