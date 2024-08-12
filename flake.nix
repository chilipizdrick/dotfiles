{
  description = "Nixos config & home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hyprlock = {
      url = "git+https://github.com/hyprwm/hyprlock?submodules=1/ref=refs/tags/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
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
        hyprland.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
        grub2-themes.nixosModules.default
      ];
      defaultHomeManagerOptions = [
        hyprland.homeManagerModules.default
        nix-flatpak.homeManagerModules.nix-flatpak
        spicetify-nix.homeManagerModules.default
      ];
    in {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      overlays = import ./overlays {inherit inputs;};
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        atlas = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules =
            defaultNixosModules
            ++ [
              ./nixos/atlas/configuration.nix
            ];
        };
        aurora = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules =
            defaultNixosModules
            ++ [
              ./nixos/aurora/configuration.nix
            ];
        };
      };

      homeConfigurations = {
        "alex@atlas" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
          modules =
            defaultHomeManagerOptions
            ++ [
              ./home-manager/atlas/home.nix
            ];
        };
        "alex@aurora" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
          modules =
            defaultHomeManagerOptions
            ++ [
              ./home-manager/aurora/home.nix
            ];
        };
      };
    };
}
