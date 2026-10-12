{pkgs, ...}: {
  programs.command-not-found.enable = false;

  environment.systemPackages = [
    pkgs.alejandra
    pkgs.bat
    pkgs.curl
    pkgs.dust
    pkgs.fd
    pkgs.ffmpeg
    pkgs.fzf
    pkgs.git
    pkgs.gzip
    pkgs.hyperfine
    pkgs.imagemagick
    pkgs.jq
    pkgs.jujutsu
    pkgs.microfetch
    pkgs.neovim
    pkgs.p7zip
    pkgs.ripgrep
    pkgs.socat
    pkgs.sops
    pkgs.tealdeer
    pkgs.tmux
    pkgs.tmux-sessionizer
    pkgs.unzip
    pkgs.wget
    pkgs.zip
  ];
}
