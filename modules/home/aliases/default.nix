{...}: {
  home.shellAliases = {
    l = "ls -l";
    ll = "ls -l";
    la = "ls -a";
    lla = "ls -la";
    ga = "git add .";
    gc = "git commit -S";
    gpl = "git pull";
    gps = "git push";
    gs = "git status";
    nrs = "sudo nixos-rebuild switch --flake .";
    hms = "home-manager switch --flake . -b backup";
    oe = "nautilus . &";
    vi = "nvim";
    vim = "nvim";
    vimdiff = "nvim -d";
  };
}
