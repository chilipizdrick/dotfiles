{...}: {
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    audio.enable = true;
    jack.enable = true;

    # extraConfig.pipewire."99-low-latency" = {
    #   "context.properties" = {
    #     "default.clock.rate" = 48000;
    #     "default.clock.quantum" = 128;
    #     "default.clock.min-quantum" = 32;
    #     "default.clock.max-quantum" = 512;
    #   };
    # };
  };
}
