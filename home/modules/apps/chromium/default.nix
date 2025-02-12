{...}: {
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation,VaapiVideoDecoder"
    ];
  };
}
