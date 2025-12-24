{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_stable;
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  # boot.kernelPackages = inputs'.nix-cachyos-kernel.legacyPackages.linuxPackages-cachyos-bore-lto;
}
