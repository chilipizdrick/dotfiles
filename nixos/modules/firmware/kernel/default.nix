{pkgs, ...}: {
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_lqx;
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  # boot.kernelPackages = inputs'.nix-cachyos-kernel.legacyPackages.linuxPackages-cachyos-lts;
}
