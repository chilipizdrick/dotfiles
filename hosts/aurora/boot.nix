{lib, ...}: {
  boot.loader = {
    timeout = lib.mkForce null;
    systemd-boot.windows.windows-11 = {
      title = "Windows 11";
      efiDeviceHandle = "FS0";
    };
  };
}
