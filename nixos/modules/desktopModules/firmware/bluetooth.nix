{...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.pipewire.wireplumber.enable = true;
  services.pipewire.wireplumber.extraConfig = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = ["hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag"];
    };
  };
  services.blueman.enable = true;
}