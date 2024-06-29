{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [24 80 443 25565];
    allowedUDPPortRanges = [
      {
        from = 25565;
        to = 25565;
      }
      {
        from = 24;
        to = 24;
      }
    ];
  };

  # Enable CUPS to print documents
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktop managers)
  services.libinput.enable = true;

  # Mount, trash, and other functionalities
  services.gvfs.enable = true;

  # Thumbnail support for images
  services.tumbler.enable = true;

  # Some programs need SUID wrappers, can be configured further or are started in user sessions
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Driver and other firmware updates
  services.fwupd.enable = true;
  hardware.enableAllFirmware = true;

  # Amd drivers
  hardware.cpu.amd.updateMicrocode = true;
  services.xserver.videoDrivers = ["amdgpu"];
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
}
