{...}: {
  home.shellAliases = {
    l = "ls -l";
    ll = "ls -l";
    la = "ls -a";
    ns = "nix-search-tv print | tv";
    ga = "git add .";
    gc = "git commit -m ";
    gpl = "git pull";
    gps = "git push";
    tmux = "TERM=\"tmux-256color\" tmux -u";
    tms = "TERM=\"tmux-256color\" tms";
    nrs = "sudo nixos-rebuild switch --flake .";
    hms = "home-manager switch --flake .";
    nau = "export NIXPKGS_ALLOW_UNFREE=1";
  };
}
