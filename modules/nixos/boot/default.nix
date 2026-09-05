{...}: {
  boot.kernelParams = ["quiet" "loglevel=3" "systemd.show_status=auto" "rd.udev.log_level=3"];
  boot.loader = {
    timeout = 0;
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 3;
    };
  };
}
