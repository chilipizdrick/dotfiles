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

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    scripts = {
      url = "github:chilipizdrick/nix-scripts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sl1 = {
    #   url = "github:chilipizdrick/sl1?dir=sl1-desktop";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     flake-parts.follows = "flake-parts";
    #   };
    # };

    wroomer = {
      url = "github:chilipizdrick/wroomer";
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

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./nixos ./home];
      systems = ["x86_64-linux"];
      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };
    };
}
