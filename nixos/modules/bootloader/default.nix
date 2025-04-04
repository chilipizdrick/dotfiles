{...}: {
  boot.loader = {
    timeout = 3;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      configurationLimit = 5;
      timeoutStyle = "hidden";
    };
  };
}
