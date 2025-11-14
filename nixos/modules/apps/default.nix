{
  pkgs,
  inputs',
  ...
}: {
  imports = [
    # ./android-studio
    # ./chromium
    ./disable-command-not-found
    # ./kde-connect
    ./nautilus
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    ripgrep
    fd
    fzf
    wget
    curl
    jq
    git
    jujutsu
    zip
    unzip
    p7zip
    gzip
    neovim
    socat
    tmux
    tmux-sessionizer
    microfetch
    alejandra
    sops
    tealdeer
    imagemagick
    ffmpeg
    bat
    television
    onlyoffice-desktopeditors
  ];
}
