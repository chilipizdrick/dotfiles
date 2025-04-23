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

    sl1 = {
      url = "github:chilipizdrick/sl1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:chilipizdrick/wallpapers";
      flake = false;
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    scripts = inputs.scripts.packages."x86_64-linux";
    specialArgs = {
      inherit inputs;
      inherit scripts;
    };
    extraSpecialArgs = specialArgs;
  in {
    formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".alejandra;
    nixosConfigurations = import ./nixos/configurations.nix (inputs // {inherit specialArgs;});
    homeConfigurations = import ./home/configurations.nix (inputs // {inherit extraSpecialArgs;});
  };
}
