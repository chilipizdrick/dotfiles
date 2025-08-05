{lib, ...}: {
  services.zapret = {
    whitelist = lib.mkDefault [
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

      "spotify.com"
      "scdn.co"
      "spotifycdn.com"
      "spotifycdn.net"
      "spoti.fi"
      "spotify.link"

      "irc.warframe.com"
    ];
  };
}
