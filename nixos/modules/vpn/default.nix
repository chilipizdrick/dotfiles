{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./wireguard
    ./zerotier
  ];
}
