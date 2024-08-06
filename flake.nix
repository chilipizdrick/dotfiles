{
  description = "Nixos config & home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    wallpapers = {
      url = "github:chilipizdrick/wallpapers";
      flake = false;
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    gBar.url = "github:scorpion-26/gBar";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    grub2-themes,
    spicetify-nix,
    nix-flatpak,
    gBar,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      # "aarch64-linux"
      # "i686-linux"
      "x86_64-linux"
      # "aarch64-darwin"
      # "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      atlas = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          grub2-themes.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak

          ./nixos/atlas/configuration.nix
        ];
      };
      aurora = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          grub2-themes.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak

          ./nixos/aurora/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "alex@atlas" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          spicetify-nix.homeManagerModules.default
          nix-flatpak.homeManagerModules.nix-flatpak
          gBar.homeManagerModules.x86_64-linux.default

          ./home-manager/atlas/home.nix
        ];
      };
      "alex@aurora" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          spicetify-nix.homeManagerModules.default
          nix-flatpak.homeManagerModules.nix-flatpak
          gBar.homeManagerModules.x86_64-linux.default

          ./home-manager/aurora/home.nix
        ];
      };
    };
  };
}
