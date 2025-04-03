{...}: {
  # Set default applications
  xdg.mimeApps.enable = true;
  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";

      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
      "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";

      "inode/directory" = "org.gnome.Nautilus.desktop";

      "application/pdf" = ["org.pwmt.zathura.desktop" "zen_twilight.desktop"];
      "application/doc" = "onlyoffice-desktopeditors.desktop";
      "application/docx" = "onlyoffice-desktopeditors.desktop";
      "application/msword" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "onlyoffice-desktopeditors.desktop";

      "image/png" = ["imv.desktop" "gimp.desktop"];
      "image/jpg" = ["imv.desktop" "gimp.desktop"];
      "image/jpeg" = ["imv.desktop" "gimp.desktop"];
      "image/webp" = ["imv.desktop" "gimp.desktop"];
      "image/gif" = ["imv.desktop" "gimp.desktop"];

      "video/mp4" = "mpv.desktop";
      "video/mkv" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/avi" = "mpv.desktop";

      "audio/aac" = "org.gnome.Decibels.desktop";
      "audio/mpeg" = "org.gnome.Decibels.desktop";
      "audio/ogg" = "org.gnome.Decibels.desktop";
      "audio/wav" = "org.gnome.Decibels.desktop";
      "audio/flac" = "org.gnome.Decibels.desktop";
      "audio/m4a" = "org.gnome.Decibels.desktop";
      "audio/opus" = "org.gnome.Decibels.desktop";
      "audio/mp3" = "org.gnome.Decibels.desktop";
      "audio/webm" = "org.gnome.Decibels.desktop";

      # "audio/aac" = "mpv.desktop";
      # "audio/mpeg" = "mpv.desktop";
      # "audio/ogg" = "mpv.desktop";
      # "audio/wav" = "mpv.desktop";
      # "audio/flac" = "mpv.desktop";
      # "audio/webm" = "mpv.desktop";
      # "audio/m4a" = "mpv.desktop";
      # "audio/opus" = "mpv.desktop";
      # "audio/mp3" = "mpv.desktop";
    };
  };
}
