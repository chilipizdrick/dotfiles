{pkgs, ...}: {
  home.packages = with pkgs; [
    ranger
    file
    ffmpeg
    ffmpegthumbnailer
    mediainfo
    ueberzugpp
    highlight
  ];

  home.file.".config/ranger/scope.sh".source = ./config/scope.sh;
  home.file.".config/ranger/rc.conf".source = ./config/rc.conf;
}
