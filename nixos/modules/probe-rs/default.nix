{pkgs, ...}: let
  probe-rs-rules = pkgs.stdenv.mkDerivation {
    name = "probe-rs-rules";
    src = ./.;
    installPhase = ''
      mkdir -p $out/lib/udev/rules.d
      cp 69-probe-rs.rules $out/lib/udev/rules.d/
    '';
  };
in {
  environment.systemPackages = with pkgs; [probe-rs-tools];
  services.udev.packages = [probe-rs-rules];
}
