{
  pkgs,
  fetchFromGitHub,
}:
pkgs.buildGoModule rec {
  pname = "SpoofDPI";
  version = "v0.11.1";

  src = fetchFromGitHub {
    owner = "xvzc";
    repo = pname;
    rev = version;
    sha256 = "sha256-GdGOnaIDy7XWWo0MOu+HfQcLrW/PDlRxf0y1jjJrZNQ=";
  };

  vendorHash = "sha256-47Gt5SI6VXq4+1T0LxFvQoYNk+JqTt3DonDXLfmFBzw=";
}
