{
  lib,
  rustPlatform,
}: let
  name = "daemonologist";
in
  rustPlatform.buildRustPackage {
    inherit name;
    pname = name;
    version = "0.1.1";
    src = lib.cleanSource ./.;
    cargoLock.lockFile = ./Cargo.lock;
  }
