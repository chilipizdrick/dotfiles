{pkgs, ...}: {
  services.kanata = {
    enable = true;
    package = pkgs.unstable.kanata;
    keyboards."default" = {
      config = ''
        (defsrc)

        (deflayermap (base-layer)
          caps esc
        )
      '';
    };
  };
}
