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
    system ? "x86_64-linux",
  }: extraNixosModules: let
    primes = getPrimes system inputs;

    homeManagerModules = [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
            inherit (primes) inputs' self';
          };
          users.alex.imports = listModulesRecursive ./modules/home;
        };
      }
    ];
  in
    lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit (primes) inputs' self';
      };
      modules =
        (listModulesRecursive ./modules/nixos)
        ++ homeManagerModules
        ++ extraNixosModules;
    };

  importHostsConfig = hostsPath: inputs: let
    hosts = listModulesRecursive hostsPath;
  in
    lib.foldr
    (mod: acc: lib.recursiveUpdate (import mod inputs) acc)
    {}
    hosts;

  withVpnDesktop = pkgs: package:
    pkgs.runCommand "${package.pname or package.name}-vpn-desktop" {
      nativeBuildInputs = [
        pkgs.gnused
        pkgs.coreutils
      ];
    } ''
      mkdir -p "$out/share/applications"

      for desktop in ${package}/share/applications/*.desktop; do
        [ -e "$desktop" ] || continue

        name="$(basename "$desktop" .desktop)"

        cp "$desktop" \
          "$out/share/applications/$name.desktop"

        sed \
          -e 's/^Name=\(.*\)$/Name=\1 (VPN)/' \
          -e 's|^Exec=|Exec=/run/wrappers/bin/vpn-launch |' \
          "$desktop" \
          > "$out/share/applications/$name-vpn.desktop"
      done
    '';
}
