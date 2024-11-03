{...}: {
  # Set default applications
  xdg.mimeApps.enable = true;
  xdg.mimeApps = {
    defaultApplications = {
      # "text/html" = "firefox.desktop";
      # "x-scheme-handler/http" = "firefox.desktop";
      # "x-scheme-handler/https" = "firefox.desktop";
      # "x-scheme-handler/about" = "firefox.desktop";
      # "x-scheme-handler/unknown" = "firefox.desktop";
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";

      "inode/directory" = "org.gnome.Nautilus.desktop";

      "application/pdf" = ["org.pwmt.zathura.desktop" "firefox.desktop"];
      "application/doc" = "libreoffice-writer.desktop";
      "application/docx" = "libreoffice-writer.desktop";
      "application/msword" = "libreoffice-writer.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";

      "image/png" = ["imv.desktop" "gimp.desktop"];
      "image/jpg" = ["imv.desktop" "gimp.desktop"];
      "image/jpeg" = ["imv.desktop" "gimp.desktop"];
      "image/webp" = ["imv.desktop" "gimp.desktop"];
      "image/gif" = ["imv.desktop" "gimp.desktop"];

      "video/mp4" = "mpv.desktop";
      "video/mkv" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/avi" = "mpv.desktop";

      "audio/aac" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "audio/wav" = "mpv.desktop";
      "audio/webm" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";
      "audio/m4a" = "mpv.desktop";
      "audio/opus" = "mpv.desktop";
    };
  };
}
