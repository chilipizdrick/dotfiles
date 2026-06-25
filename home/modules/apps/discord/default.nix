{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    discord.vencord.enable = true;
    enable = true;
    config.plugins = {
      fakeNitro.enable = true;
      youtubeAdblock.enable = true;
      noF1.enable = true;
      copyFileContents.enable = true;
      alwaysTrust.enable = true;
    };
  };
}
