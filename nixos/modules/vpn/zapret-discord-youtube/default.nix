{inputs, ...}: {
  imports = [
    inputs.zapret-discord-youtube.nixosModules.default
  ];
  services.zapret-discord-youtube = {
    enable = true;
    config = "general (SIMPLE FAKE)"; # Или любой конфиг из папки configs (general, general(ALT), general (SIMPLE FAKE) и т.д.)

    # Добавляем кастомные домены в list-general.txt
    # listGeneral = [
    #   "youtu.be"
    #   "youtube.com"
    #   "googlevideo.com"
    #   "ytimg.com"
    #   "youtubei.googleapis.com"
    #   "youtube-ui.l.google.com"
    #   "youtube.googleapis.com"
    #
    #   "dis.gd"
    #   "discord.co"
    #   "discord.com"
    #   "discord.design"
    #   "discord.dev"
    #   "discord.qgg"
    #   "discord.qgift"
    #   "discord.qifts"
    #   "discord.media"
    #   "discord.new"
    #   "discord.store"
    #   "discord.tools"
    #   "discordapp.com"
    #   "discordapp.net"
    #   "discordmerch.com"
    #   "discordpartygames.com"
    #   "discord-activities.com"
    #   "discordactivities.com"
    #   "discordsays.com"
    #   "discordstatus.com"
    #
    #   "x.com"
    #   "twitter.com"
    #   "t.co"
    #   "twimg.com"
    #
    #   "medium.com"
    #
    #   "rutracker.org"
    #   "rutracker.net"
    #
    #   "spotify.com"
    #   "scdn.co"
    #   "spotifycdn.com"
    #   "spotifycdn.net"
    #   "spoti.fi"
    #   "spotify.link"
    #
    #   "irc.warframe.com"
    # ];

    # # Добавляем домены в list-exclude.txt (исключения)
    # listExclude = ["ubisoft.com" "origin.com"];
    #
    # # Добавляем IP адреса в ipset-all.txt
    # ipsetAll = ["192.168.1.0/24" "10.0.0.1"];
    #
    # # Добавляем IP адреса в ipset-exclude.txt (исключения)
    # ipsetExclude = ["203.0.113.0/24"];
  };
}
