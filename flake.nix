{
  description = "Personal NixOS & home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    flint = {
      url = "github:NotAShelf/flint";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    zen-nebula = {
      url = "github:JustAdumbPrsn/Nebula-A-Minimal-Theme-for-Zen-Browser";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
      };
    };

    scripts = {
      url = "github:chilipizdrick/nix-scripts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sl1 = {
      url = "github:chilipizdrick/sl1";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    hijacker = {
      url = "github:chilipizdrick/hijacker";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    wallpapers = {
      url = "github:chilipizdrick/wallpapers";
      flake = false;
    };
  };

  outputs = {self, ...} @ inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
      ];

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };

      flake = let
        scripts = inputs.scripts.packages."x86_64-linux";
        specialArgs = {
          inherit inputs self scripts;
        };
        extraSpecialArgs = specialArgs;
      in {
        nixosConfigurations = import ./nixos/configurations.nix (inputs // {inherit specialArgs;});
        homeConfigurations = import ./home/configurations.nix (inputs // {inherit extraSpecialArgs;});
      };
    };
}
