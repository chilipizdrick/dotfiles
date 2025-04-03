{...}: {
  powerManagement = {
    enable = true;
    # powertop.enable = true;
  };
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
  #     CPU_DRIVER_OPMODE_ON_AC = "passive";
  #     CPU_DRIVER_OPMODE_ON_BAT = "passive";
  #
  #     CPU_SCALING_GOVERNOR_ON_AC = "ondemand";
  #     CPU_SCALING_GOVERNOR_ON_BAT = "conservative";
  #
  #     CPU_BOOST_ON_AC = 1;
  #     CPU_BOOST_ON_BAT = 0;
  #
  #     PLATFORM_PROFILE_ON_AC = "performance";
  #     PLATFORM_PROFILE_ON_BAT = "low-power";
  #
  #     RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
  #     RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
  #   };
  # };

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
