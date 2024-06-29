{
  config,
  lib,
  pkgs,
  ...
}: {
  # Set timezone
  time.timeZone = "Europe/Moscow";

  # Store time in local time
  time.hardwareClockInLocalTime = true;
}
