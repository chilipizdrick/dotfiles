{
  config,
  lib,
  pkgs,
  ...
}: {
  # It was a mistake on my part to spend 20 hrs writing this thing as I did not know
  # that setting scaling factor to 2.0 in wayald would also cut resolutions in half for
  # x11. Everithing regarding the display EDID was actually fine.
  # My workaround was to bind setting scale factor to 1.0 and 2.0 in sway config.

  boot.kernelPatches = [
    {
      name = "edid-loader-fix-config";
      patch = null;
      extraConfig = ''
        FW_LOADER y
      '';
    }
  ];
  # boot.kernelParams = [ "drm.edid_firmware=eDP-1:edid/edid.bin" ];
  boot.kernelParams = ["drm.edid_firmware=eDP-1:edid/edid.bin" "video=eDP-1:e"];
  hardware.firmware = [
    (
      pkgs.runCommand "edid.bin" {}
      /*
      bash
      */
      ''
        mkdir -p $out/lib/firmware/edid
        cp ${./38DDDA86C0E2.bin} $out/lib/firmware/edid/edid.bin
      ''
    )
  ];
}
