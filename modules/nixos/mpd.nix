{pkgs, ...}: let
  mpdConfig = pkgs.writeText "mpd.conf" ''
    music_directory                  "~/Music"
    playlist_directory               "~/Music/playlists"
    db_file                          "~/.local/share/mpd/database"
    state_file                       "~/.local/share/mpd/state"
    sticker_file                     "~/.local/share/mpd/sticker.sql"

    bind_to_address                  "127.0.0.1"
    port                             "6600"

    log_level                        "default"
    restore_paused                   "yes"
    save_absolute_paths_in_playlists "no"
    auto_update                      "yes"
    auto_update_depth                "4"
    follow_outside_symlinks          "no"
    follow_inside_symlinks           "no"

    replaygain                       "auto"
    replaygain_preamp                "0"
    replaygain_missing_preamp        "0"
    replaygain_limit                 "yes"
    volume_normalization             "no"

    filesystem_charset               "UTF-8"
    audio_buffer_size                "4096"
    max_output_buffer_size           "65536"

    playlist_plugin {
            name                     "m3u"
            enabled                  "true"
    }

    audio_output {
            type                     "pipewire"
            name                     "PipeWire"
    }
  '';

  mpdMprisStart = pkgs.writeShellScript "mpd-mpris-start" ''
    exec ${pkgs.mpd-mpris}/bin/mpd-mpris -no-instance
  '';
in {
  environment.systemPackages = [
    pkgs.mpc
    pkgs.mpd
    pkgs.rmpc
    pkgs.euphonica
  ];

  environment.etc."mpd.conf".source = mpdConfig;

  systemd.user.services.mpd = {
    description = "Music Player Daemon";
    wantedBy = ["default.target"];
    after = ["network.target" "sound.target" "pipewire.service"];
    wants = ["pipewire.service"];
    preStart = ''mkdir -p "$HOME/.local/share/mpd" "$HOME/Music/playlists"'';

    serviceConfig = {
      Type = "notify";
      ExecStart = "${pkgs.mpd}/bin/mpd --systemd ${mpdConfig}";
      Restart = "on-failure";
      RestartSec = "5";
    };
  };

  systemd.user.services.mpd-mpris = {
    description = "mpd-mpris: An implementation of the MPRIS protocol for MPD";
    wantedBy = ["default.target"];
    requires = ["mpd.service"];
    after = ["mpd.service"];

    serviceConfig = {
      Type = "dbus";
      BusName = "org.mpris.MediaPlayer2.mpd";
      ExecStart = mpdMprisStart;
      Restart = "on-failure";
      RestartSec = "5";
    };
  };
}
