{...}: {
  users.users = {
    alex = {
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = [
        "admin"
        "networkmanager"
        "wheel"
        "audio"
        "docker"
        "video"
        "dialout"
        "scanner"
        "lp"
        "input"
        "uinput"
        "adm"
        "kvm"
        "users"
        "systemd-journal"
      ];
    };
  };
}
