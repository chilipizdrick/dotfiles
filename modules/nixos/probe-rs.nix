{
  pkgs,
  self',
  ...
}: {
  environment.systemPackages = [pkgs.probe-rs-tools];
  services.udev.packages = [self'.packages.probe-rs-udev-rules];
}
