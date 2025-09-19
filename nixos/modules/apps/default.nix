{
  pkgs,
  inputs',
  ...
}: {
  imports = [
    # ./android-studio
    ./chromium
    ./command-not-found
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
    zip
    unzip
    p7zip
    gzip
    neovim
    socat
    tmux
    tmux-sessionizer
    btop
    microfetch
    alejandra
    sops
    tealdeer
    imagemagick
    ffmpeg
    bat
    television
    onlyoffice-bin
  ];
}
