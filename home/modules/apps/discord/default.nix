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
      enabledThemes = ["discord-mica.theme.css"];
    };
  };

  xdg.configFile."Vencord/themes/discord-mica.theme.css".source = ./discord-mica.theme.css;
}
