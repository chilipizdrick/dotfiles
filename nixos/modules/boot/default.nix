{...}: {
  boot.kernelParams = ["quiet" "loglevel=3" "systemd.show_status=auto" "rd.udev.log_level=3" "pcie_aspm=off"];
  boot.loader = {
    timeout = 0;
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 3;
    };
  };

  boot.extraModprobeConfig = ''
    options rtw89_pci disable_aspm=y
    options rtw89_core disable_ps_mode=y
  '';
}
