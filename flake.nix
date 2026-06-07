{
  description = "Personal NixOS & home-manager config";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay?ref=stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sl2.url = "github:chilipizdrick/sl2";
    wroomer.url = "github:chilipizdrick/wroomer";
    hijacker2.url = "github:chilipizdrick/hijacker2";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./nixos ./home];
      systems = ["x86_64-linux"];
      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
        packages = import ./pkgs pkgs;
      };
    };
}
