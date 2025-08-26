{...}: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    # jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    audio.enable = true;
  };
}
