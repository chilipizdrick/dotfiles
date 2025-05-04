{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.zen-nebula.homeModules.default];

  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.beta
  ];

  zen-nebula = {
    enable = true;
    profile = "default";
  };
}
