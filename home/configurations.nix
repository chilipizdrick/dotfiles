{
  home-manager,
  nixpkgs,
  extraSpecialArgs,
  ...
}: {
  "alex@atlas" = home-manager.lib.homeManagerConfiguration {
    inherit extraSpecialArgs;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ./hosts/atlas/home.nix
    ];
  };
  "alex@aurora" = home-manager.lib.homeManagerConfiguration {
    inherit extraSpecialArgs;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ./hosts/aurora/home.nix
    ];
  };
}
