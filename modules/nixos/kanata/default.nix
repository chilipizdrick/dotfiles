{pkgs, ...}: {
  services.kanata = {
    enable = true;
    package = pkgs.unstable.kanata;
    keyboards.default.config = ''
      (defsrc
        caps
      )

      (deflayer base
        esc
      )
    '';
  };
}
