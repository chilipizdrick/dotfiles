{
  description = "chilipizdrick's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hijacker2.url = "github:chilipizdrick/hijacker2";
    wroomer.url = "github:chilipizdrick/wroomer";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    lib = import ./lib.nix nixpkgs.lib;
  in
    {
      inherit lib;
      packages = lib.forAllSystems (system: import ./packages nixpkgs.legacyPackages.${system});
    }
    // (lib.importHostsConfig ./hosts inputs);
}
