{...}: {
  programs.chromium = {
    enable = false;
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation,VaapiVideoDecoder"
      "--disable-infobars"
      "--disable-session-crashed-bubble"
    ];
  };
}
