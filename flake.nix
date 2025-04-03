{
  description = "Personal NixOS & home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    scripts = {
      url = "github:chilipizdrick/nix-scripts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:chilipizdrick/wallpapers";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    scripts = inputs.scripts.packages."x86_64-linux";
    specialArgs = {
      inherit inputs;
      inherit scripts;
    };
    extraSpecialArgs = specialArgs;
  in {
    formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".alejandra;

    nixosConfigurations = {
      "atlas" = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./nixos/hosts/atlas/configuration.nix
        ];
      };
      "aurora" = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./nixos/hosts/aurora/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "alex@atlas" = home-manager.lib.homeManagerConfiguration {
        inherit extraSpecialArgs;
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./home/hosts/atlas/home.nix
        ];
      };
      "alex@aurora" = home-manager.lib.homeManagerConfiguration {
        inherit extraSpecialArgs;
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./home/hosts/aurora/home.nix
        ];
      };
    };
  };
}
