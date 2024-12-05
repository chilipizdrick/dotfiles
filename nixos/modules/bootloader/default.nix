{...}: {
  boot.loader = {
    timeout = 3;
    efi.canTouchEfiVariables = true;
    # systemd-boot = {
    #   enable = true;
    #   configurationLimit = 3;
    # };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 5;
      timeoutStyle = "hidden";
    };
  };
}
