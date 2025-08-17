{config, ...}: {
  boot.extraModulePackages = [config.boot.kernelPackages.amneziawg];
  programs.amnezia-vpn.enable = true;
}
