{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            # 1. EFI /boot partition (1 GiB)
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };

            # 2. Swap partition (16 GiB) for hibernation
            swap = {
              size = "16G";
              type = "8200";
              content = {
                type = "swap";
                # Disko translates this to `boot.resumeDevice` in NixOS for hibernation
                resumeDevice = true;
              };
            };

            # 3. Root partition (Remaining space)
            root = {
              size = "100%FREE";
              content = {
                type = "filesystem";
                format = "btrfs";
                mountpoint = "/";
                # Sensible Btrfs defaults for SSDs
                mountOptions = ["noatime"];
              };
            };
          };
        };
      };
    };
  };
}
