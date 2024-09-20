{
  description = "Personal NixOs & home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-24.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    };

    wallpapers = {
      url = "github:chilipizdrick/wallpapers";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs:
    with inputs; let
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      defaultNixosModules = [
        nix-flatpak.nixosModules.nix-flatpak
      ];
      defaultHomeManagerModules = [
        nix-flatpak.homeManagerModules.nix-flatpak
        spicetify-nix.homeManagerModules.default
      ];
    in {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      overlays = import ./overlays {inherit inputs;};
      nixosModules = import ./nixos/modules;
      homeManagerModules = import ./home-manager/modules;

      nixosConfigurations = {
        "atlas" = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules =
            defaultNixosModules
            ++ [
              ./nixos/hosts/atlas/configuration.nix
            ];
        };
        "aurora" = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules =
            defaultNixosModules
            ++ [
              ./nixos/hosts/aurora/configuration.nix
            ];
        };
      };

      homeConfigurations = {
        "alex@atlas" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
          modules =
            defaultHomeManagerModules
            ++ [
              ./home-manager/hosts/atlas/home.nix
            ];
        };
        "alex@aurora" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
          modules =
            defaultHomeManagerModules
            ++ [
              ./home-manager/hosts/aurora/home.nix
            ];
        };
      };
    };
}
