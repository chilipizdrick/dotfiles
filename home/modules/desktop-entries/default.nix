{...}: {
  # Fixes for electron apps
  xdg.desktopEntries = {
    spotify-xwayland = {
      type = "Application";
      name = "Spotify on Xwayland";
      genericName = "Music Player";
      icon = "spotify-client";
      exec = "env -u WAYLAND_DISPLAY spotify %U";
      terminal = false;
      mimeType = ["x-scheme-handler/spotify"];
      categories = ["Audio" "Music" "Player" "AudioVideo"];
      settings = {
        StartupWMClass = "spotify";
      };
    };
  };
}
