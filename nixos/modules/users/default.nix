{...}: {
  users.users = {
    alex = {
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = [
        "adbusers"
        "adm"
        "admin"
        "audio"
        "dialout"
        "docker"
        "gamemode"
        "input"
        "kvm"
        "lp"
        "networkmanager"
        "plugdev"
        "scanner"
        "systemd-journal"
        "uinput"
        "users"
        "video"
        "wheel"
        "wireshark"
      ];
    };
  };

  users.groups.plugdev = {};
}
