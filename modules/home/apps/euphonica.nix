{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [pkgs.euphonica];

  dconf.settings = {
    "io/github/htkhiem/Euphonica/client" = {
      mpd-use-own-server = false;
      mpd-use-unix-socket = true;
      mpd-unix-socket = "${config.home.homeDirectory}/.config/mpd/socket";
      mpd-host = "127.0.0.1";
      mpd-port = lib.hm.gvariant.mkUint32 6600;
      mpd-visualizer-pcm-source = "pipewire";
    };

    "io/github/htkhiem/Euphonica/metaprovider/lrclib" = {
      enabled = true;
    };

    "io/github/htkhiem/Euphonica/metaprovider/musicbrainz" = {
      enabled = true;
    };

    "io/github/htkhiem/Euphonica/state/queueview" = {
      show-lyrics = true;
      use-synced-lyrics = true;
    };
  };
}
