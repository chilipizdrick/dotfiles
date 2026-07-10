{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    # systemd.enable = true;
    settings = ./config.toml;
  };

  home.packages = with pkgs; [
    gpu-screen-recorder
  ];
}
