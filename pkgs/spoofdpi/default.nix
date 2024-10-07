{
  pkgs,
  fetchFromGitHub,
  lib,
}:
pkgs.buildGoModule rec {
  pname = "SpoofDPI";
  version = "v0.12.0";

  src = fetchFromGitHub {
    owner = "xvzc";
    repo = pname;
    rev = version;
    sha256 = lib.fakeSha;
  };

  vendorHash = "sha256-47Gt5SI6VXq4+1T0LxFvQoYNk+JqTt3DonDXLfmFBzw=";
}
