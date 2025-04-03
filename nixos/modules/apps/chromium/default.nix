{...}: {
  programs.chromium = {
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden Password Manager
      "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for GitHub
      "gebbhagfogifgggkldgodflihgfeippi" # Return YouTube Dislike
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for YouTube
      "jiaopdjbehhjgokpphdfgmapkobbnmjp" # Youtube-shorts block
      "fdaphilojaklgkoocegabckfanjoacjg" # mtab
    ];
    extraOpts = {
      "RestoreOnStartup" = 1;
      "FullRestoreEnabled" = true;
      "FullRestoreMode" = 1;
      "BrowserSignin" = 0;
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = true;
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "en-US"
        "ru"
      ];
    };
  };
}
