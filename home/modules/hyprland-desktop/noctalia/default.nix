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
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    gpu-screen-recorder
  ];
}
