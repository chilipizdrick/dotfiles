{...}: {
  imports = [
    ../modules
  ];
  nixpkgs = let
    overlays = import ../../overlays {};
  in {
    overlays = [
      overlays.additions
      overlays.modifications
      overlays.scripts
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-runtime-6.0.36"
        "dotnet-sdk-6.0.428"
        "dotnet-sdk-wrapped-6.0.428"
      ];
    };
  };

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
