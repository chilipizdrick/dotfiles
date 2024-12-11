{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ripgrep
    fd
    wget
    curl
    jq
    git
    zip
    unzip
    gzip
    neovim

    tmux
    tmux-sessionizer
    btop
    fastfetch
    alejandra

    sops
    tealdeer
    imagemagick
    ffmpeg
  ];
}
