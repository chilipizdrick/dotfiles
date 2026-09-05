lib: let
  applySystem = system: input:
    if lib.isAttrs input
    then
      lib.mapAttrs (
        name: value:
          if lib.isAttrs value && lib.hasAttr system value
          then value.${system}
          else value
      )
      input
    else input;
in rec {
  listModulesRecursive = path: let
    isModuleViable = p: let
      base = baseNameOf p;
    in
      lib.hasSuffix ".nix" base && !lib.hasPrefix "_" base;
  in
    builtins.filter isModuleViable (lib.filesystem.listFilesRecursive path);

  forAllSystems = let
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  in
    lib.genAttrs systems;

  getPrimes = system: inputs: let
    inputs' = lib.mapAttrs (_: input: applySystem system input) inputs;
  in {
    inherit inputs';
    self' = inputs'.self;
  };

  withSystem = system: inputs: f:
    f (getPrimes system inputs);

  nixosSystem = {
    inputs,
    extraModules,
    system ? "x86_64-linux",
  }: let
    primes = getPrimes system inputs;
  in
    lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit (primes) inputs' self';
      };
      modules = (listModulesRecursive ./modules/nixos) ++ extraModules;
    };

  homeManagerConfiguration = {
    inputs,
    extraModules,
    system ? "x86_64-linux",
  }: let
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    primes = getPrimes system inputs;
  in
    inputs.home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit inputs;
        inherit (primes) inputs' self';
      };
      inherit pkgs;
      modules = (listModulesRecursive ./modules/home) ++ extraModules;
    };

  importHostsConfig = hostsPath: inputs: let
    hosts = listModulesRecursive hostsPath;
  in
    lib.foldr
    (mod: acc: lib.recursiveUpdate (import mod inputs) acc)
    {}
    hosts;
}
