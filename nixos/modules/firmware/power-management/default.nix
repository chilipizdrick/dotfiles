{...}: {
  powerManagement.enable = true;
  services.thermald.enable = true;

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

  # services.tlp = {
  #   enable = true;
  #   settings = {
  #     AMDGPU_ABM_LEVEL_ON_BAT = 1;
  #     USB_AUTOSUSPEND = 0;
  #   };
  # };

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
