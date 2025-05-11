{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./chromium
    ./nautilus
    ./android-studio
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
    inputs.flint.packages.${system}.default
  ];
}
