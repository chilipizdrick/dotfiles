{pkgs, ...}: {
  imports = [
    ./chromium
    ./nautilus
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    ripgrep
    fd
    wget
    curl
    jq
    git
    zip
    unzip
    p7zip
    gzip
    neovim
    tmux
    tmux-sessionizer
    btop
    pfetch-rs
    yafetch
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
