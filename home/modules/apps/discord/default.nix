{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    config = {
      # transparent = true;
      plugins = {
        betterGifPicker.enable = true;
        fakeNitro.enable = true;
        youtubeAdblock.enable = true;
        alwaysTrust.enable = true;
        clearURLs.enable = true;
        copyFileContents.enable = true;
        noF1.enable = true;
        showMeYourName.enable = true;
        unindent.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
      };
    };
  };

  # xdg.configFile."Vencord/themes/custom.theme.css".source = ./custom.theme.css;
}
