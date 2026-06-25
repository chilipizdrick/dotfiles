{
  pkgs,
  self',
  ...
}: {
  environment.systemPackages = with pkgs; [probe-rs-tools];
  services.udev.packages = [self'.packages.probe-rs-udev-rules];
}
