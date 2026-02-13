{
  inputs,
  pkgs,
  ...
}: let
  krisp-patcher =
    pkgs.writers.writePython3Bin "krisp-patcher"
    {
      libraries = with pkgs.python3Packages; [
        capstone
        pyelftools
      ];
      flakeIgnore = [
        "E501" # line too long (82 > 79 characters)
        "F403" # 'from module import *' used; unable to detect undefined names
        "F405" # name may be undefined, or defined from star imports: module
      ];
    }
    (
      builtins.readFile (
        pkgs.fetchurl {
          url = "https://pastebin.com/raw/8tQDsMVd";
          sha256 = "sha256-IdXv0MfRG1/1pAAwHLS2+1NESFEz2uXrbSdvU9OvdJ8=";
        }
      )
    );
in {
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
        copyFileContents.enable = true;
        noF1.enable = true;
        showMeYourName.enable = true;
        unindent.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
      };
    };
  };

  home.packages = [
    krisp-patcher
  ];
}
