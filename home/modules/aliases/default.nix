{...}: {
  home.shellAliases = {
    l = "ls -l";
    ll = "ls -l";
    la = "ls -a";
    lla = "ls -la";
    ns = "xdg-open https://mynixos.com/";
    ga = "git add .";
    gc = "git commit -S";
    gpl = "git pull";
    gps = "git push";
    gs = "git status";
    nrs = "sudo nixos-rebuild switch --flake .";
    hms = "home-manager switch --flake . -b backup";
    nau = "export NIXPKGS_ALLOW_UNFREE=1";
  };
}
