{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.noctalia-greeter.nixosModules.default];

  programs.noctalia-greeter = {
    enable = true;
    settings = {
      session.default = "Hyprland";
      user.default = "alex";
      cursor = {
        theme = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 20;
      };
      keyboard.layout = "us";
      appearance = {
        scheme = "Synced";
        hide_logo = true;
      };
    };
  };
}
