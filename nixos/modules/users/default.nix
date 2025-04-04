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
        "uinput"
        "adm"
        "kvm"
        "users"
        "systemd-journal"
        "input"
        "uinput"
      ];
    };
  };
}
