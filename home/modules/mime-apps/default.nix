{...}: {
  # Set default applications
  xdg.mimeApps.enable = true;
  xdg.mimeApps = {
    defaultApplications = {
      # "x-scheme-handler/http" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "x-scheme-handler/https" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "x-scheme-handler/chrome" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "text/html" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "application/x-extension-htm" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "application/x-extension-html" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "application/x-extension-shtml" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "application/xhtml+xml" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "application/x-extension-xhtml" = "userapp-Zen Browser-9LFOZ2.desktop";
      # "application/x-extension-xht" = "userapp-Zen Browser-9LFOZ2.desktop";

      "x-scheme-handler/http" = "chromium-browser.desktop";
      "x-scheme-handler/https" = "chromium-browser.desktop";
      "x-scheme-handler/about" = "chromium-browser.desktop";
      "x-scheme-handler/unknown" = "chromium-browser.desktop";

      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
      "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";

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
