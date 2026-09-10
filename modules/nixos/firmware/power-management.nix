{
  powerManagement.enable = true;

  services.tlp = {
    enable = true;

    # Enables the tlp-pd daemon, fully replacing power-profiles-daemon.
    pd.enable = true;

    settings = {
      # Controls the ACPI Platform Profile. Dictates thermal and power limits.
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      # Hardware P-State controls for modern Intel/AMD processors.
      # Instructs the CPU's internal scheduler on how quickly to scale up frequencies.
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      # Kernel-level frequency scaling governor.
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # Disabling boost on battery prevents extreme voltage spikes, massively extending battery life.
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      # Controls power states of PCIe lanes. 'powersupersave' turns off inactive lanes aggressively.
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";
      PCIE_ASPM_ON_AC = "default";
      PCIE_ASPM_ON_BAT = "powersupersave";

      # Disables WiFi power saving on AC to ensure maximum throughput and minimum latency.
      # Enables Audio power saving on battery to turn off the DAC when not playing sound.
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on";
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 1;
    };
  };

  systemd.sleep.settings.Sleep = {
    AllowSuspend = true;
    AllowHibernation = true;
    AllowSuspendThenHibernate = true;
    AllowHybridSleep = false;

    HibernateDelaySec = "30min";
    HibernateOnACPower = false;
  };

  services.logind.settings.Login.LidSwitch = "suspend-then-hibernate";
}
