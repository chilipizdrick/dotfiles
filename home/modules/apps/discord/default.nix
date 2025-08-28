{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    config = {
      transparent = true;
      plugins = {
        betterGifPicker.enable = true;
        callTimer.enable = true;
        fakeNitro.enable = true;
        oneko.enable = true;
        youtubeAdblock.enable = true;
      };
      enabledThemes = ["custom.theme.css"];
    };
  };

  xdg.configFile."Vencord/themes/custom.theme.css".source = ./custom.theme.css;
}
