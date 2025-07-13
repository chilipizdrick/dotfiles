{...}: {
  imports = [
    ./hardware-configuration.nix
    ../base-configuraion.nix
  ];

  # working config for atlas (youtube)
  # services.zapret.params = [
  #   "--dpi-desync=multidisorder"
  #   "--dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1"
  # ];

  # working config for atlas (discord + youtube)
  services.zapret = {
    enable = true;
    whitelist = [
      "youtu.be"
      "youtube.com"
      "googlevideo.com"
      "ytimg.com"
      "youtubei.googleapis.com"
      "youtube-ui.l.google.com"
      "youtube.googleapis.com"

      "dis.gd"
      "discord.co"
      "discord.com"
      "discord.design"
      "discord.dev"
      "discord.qgg"
      "discord.qgift"
      "discord.qifts"
      "discord.media"
      "discord.new"
      "discord.store"
      "discord.tools"
      "discordapp.com"
      "discordapp.net"
      "discordmerch.com"
      "discordpartygames.com"
      "discord-activities.com"
      "discordactivities.com"
      "discordsays.com"
      "discordstatus.com"

      "x.com"
      "twitter.com"
      "t.co"
      "twimg.com"

      "medium.com"

      "rutracker.org"
      "rutracker.net"
    ];
    params = [
      "--dpi-desync=fakedsplit"
      "--dpi-desync-ttl=2"
      "--dpi-desync-split-pos=1"
    ];
  };

  amdVideoDrivers.enable = true;
  games = {
    enable = true;
    steam = true;
    gamescope = true;
    minecraft = true;
  };

  swapFile = {
    enable = true;
    size = 16;
  };

  networking.hostName = "atlas";
}
