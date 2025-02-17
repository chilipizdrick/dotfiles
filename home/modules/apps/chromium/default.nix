{...}: {
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation,VaapiVideoDecoder"
      "--disable-infobars"
      "--disable-session-crashed-bubble"
    ];
  };
}
