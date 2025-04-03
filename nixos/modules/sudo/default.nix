{pkgs, ...}: {
  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "${pkgs.systemd}/bin/shutdown";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/shutdown now";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/systemctl shutdown";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/systemctl reboot";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/systemctl start";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/systemctl stop";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/reboot";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/poweroff";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.hyperion-ng}/bin/hyperiond";
            options = ["NOPASSWD"];
          }
        ];
        groups = ["wheel"];
      }
    ];
  };
}
