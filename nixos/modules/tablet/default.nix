{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
}
