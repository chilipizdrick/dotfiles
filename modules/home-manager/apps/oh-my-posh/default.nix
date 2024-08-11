{pkgs, ...}: {
  programs.oh-my-posh = {
    enable = true;
    package = pkgs.unstable.oh-my-posh;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./config.json));
  };
}
