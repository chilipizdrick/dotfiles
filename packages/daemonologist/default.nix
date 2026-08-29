{
  lib,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "daemonologist";
  name = pname;
  version = "0.1.0";
  src = lib.cleanSource ./.;
  cargoLock.lockFile = ./Cargo.lock;
}
