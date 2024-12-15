{...}: {
  home.shellAliases = {
    l = "ls -l";
    ll = "ls -l";
    la = "ls -a";
    gadd = "git add .";
    tmux = "TERM=\"tmux-256color\" tmux -u";
    tms = "TERM=\"tmux-256color\" tms";
    nrs = "sudo nixos-rebuild switch --flake .";
    hms = "home-manager switch --flake .";
  };
}
