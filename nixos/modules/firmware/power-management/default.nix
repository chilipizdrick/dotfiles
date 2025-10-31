{...}: {
  powerManagement.enable = true;
  services.thermald.enable = true;

  services.auto-cpufreq = {
    enable = false;
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

  services.tlp = {
    enable = true;
    settings = {
      # RADEON_POWER_PROFILE_ON_AC = "high";
      # RADEON_POWER_PROFILE_ON_BAT = "mid";

      AMDGPU_ABM_LEVEL_ON_BAT = 1;

      # CPU_SCALING_GOVERNOR_ON_AC = "performance";
      # CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # PLATFORM_PROFILE_ON_AC = "balanced";
      # PLATFORM_PROFILE_ON_BAT = "low-power";

      # CPU_SCALING_MIN_FREQ_ON_AC = 0;
      # CPU_SCALING_MAX_FREQ_ON_AC = 9999999;
      # CPU_SCALING_MIN_FREQ_ON_BAT = 0;
      # CPU_SCALING_MAX_FREQ_ON_BAT = 9999999;

      # CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      # CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      # Only relevant for intel cpus
      # CPU_MIN_PERF_ON_AC = 0;
      # CPU_MAX_PERF_ON_AC = 100;
      # CPU_MIN_PERF_ON_BAT = 0;
      # CPU_MAX_PERF_ON_BAT = 30;

      # CPU_BOOST_ON_AC = 1;
      # CPU_BOOST_ON_BAT = 0;

      USB_AUTOSUSPEND = 0;
    };
  };

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
