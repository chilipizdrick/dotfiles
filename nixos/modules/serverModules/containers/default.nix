{pkgs, ...}: {
  imports = [
    ./schizophrenia-bot
    # ./binary-options-bot
  ];

  virtualisation = {
    podman.enable = true;
    oci-containers.backend = "podman";
  };

  environment.systemPackages = let
    update-containers = pkgs.writeShellScriptBin "update-containers" ''
      SUDO=""
      if [[ $(id -u) -ne 0 ]]; then
       SUDO="sudo"
      fi

      images=$($SUDO ${pkgs.podman}/bin/podman ps -a --format="{{.Image}}" | sort -u)

      for image in $images
      do
        $SUDO ${pkgs.podman}/bin/podman pull $image
      done
    '';
  in [update-containers];
}
