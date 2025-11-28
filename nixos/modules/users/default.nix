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
        "input"
        "kvm"
        "lp"
        "networkmanager"
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
}
