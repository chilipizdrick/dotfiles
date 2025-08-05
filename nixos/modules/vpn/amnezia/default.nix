{config, ...}: {
  boot.extraModulePackages = [config.boot.kernelPackages.amneziawg];
}
