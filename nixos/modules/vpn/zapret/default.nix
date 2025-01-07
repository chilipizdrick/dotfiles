{...}: {
  services.zapret = {
    enable = true;
    params = [
      "--dpi-desync=multidisorder"
      "--dpi-desync-split-pos=2"
    ];
    whitelist = [
      "youtube.com"
      "googlevideo.com"
      "ytimg.com"
      "youtu.be"
      "discord.com"
      "app.discord.com"
    ];
  };
}
