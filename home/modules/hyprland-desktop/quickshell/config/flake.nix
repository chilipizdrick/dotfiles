{
  description = "Quickshell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            qt6.full
            inputs.quickshell.packages."${system}".default
          ];
          shellHook = ''
            export QML2_IMPORT_PATH="${inputs.quickshell.packages."${pkgs.system}".default}/lib/qt6/qml:$QML2_IMPORT_PATH"
          '';
        };
      };
      imports = [];
      flake = {};
    };
}
