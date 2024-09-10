{pkgs, ...}: {
  services.kmonad = {
    enable = true;
    package = pkgs.unstable.kmonad;
    keyboards."atlas-internal" = {
      name = "atlas-internal";
      device = "/dev/input/by-path/platform-i8042-serio-0-event-kb";
      config = ''
        (defcfg
          input  (device-file "/dev/input/by-path/platform-i8042-serio-0-event-kbd")
          output (uinput-sink "kmonad-kbd")
          fallthrough true
        )

        (defsrc
          caps h j k l
        )

        (deflayer base
          esc h j k l
        )

        (deflayer vi-arrows
          _ left down up right
        )

        (defalias
          vi (tap-next esc (layer-toggle vi-arrows))
        )
      '';
    };
  };
}
