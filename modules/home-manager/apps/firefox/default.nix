{...}: let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "always";
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unfilled";

      /*
      ---- EXTENSIONS ----
      */
      # Check about:support for extension/add-on ID strings.
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = {
        "*".installation_mode = "allowed"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Privacy Badger:
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
        # Dark Reader:
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
        # Material Icons for Github:
        "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/material-icons-for-github/latest.xpi";
          installation_mode = "force_installed";
        };
        # Return YouTube Dislike:
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
          installation_mode = "force_installed";
        };
        # SponsorBlock:
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
        };
        # Adaptive Bar Color:
        "ATBC@EasonWong" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/adaptive-tab-bar-colour/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      Preferences = {
        "browser.contentblocking.category" = {
          Value = "strict";
          Status = "locked";
        };
        "extensions.pocket.enabled" = lock-false;
        "extensions.screenshots.disabled" = lock-false;
        "browser.topsites.contile.enabled" = lock-false;
        "browser.formfill.enable" = lock-true;
        "browser.search.suggest.enabled" = lock-true;
        "browser.search.suggest.enabled.private" = lock-false;
        "browser.urlbar.suggest.searches" = lock-true;
        "browser.urlbar.showSearchSuggestionsFirst" = lock-true;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;

        "browser.uidensity" = {
          Value = 1;
          Status = "locked";
        };
        # "browser.sessionstore.closedTabsFromAllWindows" = lock-true;
        "browser.sessionstore.closedTabsFromClosedWindows" = lock-true;
        "gfx.webrender.all" = lock-true;
        "uc.tweak.translucency" = lock-true;
        "uc.tweak.no-window-controls" = lock-true;
      };
    };
    profiles."alex" = {
      id = 0;
      isDefault = true;
      name = "alex";
      bookmarks = [
        {
          toolbar = true;
          bookmarks = [
            {
              name = "";
              url = "https://app.todoist.com/app";
            }
            {
              name = "";
              url = "https://calendar.google.com";
            }
            {
              name = "";
              url = "https://360.yandex.ru/mail";
            }
            {
              name = "";
              url = "https://mail.google.com";
            }
            {
              name = "";
              url = "https://translate.google.com";
            }
            {
              name = "";
              url = "https://vk.com/im";
            }
            {
              name = "";
              url = "https://github.com";
            }
            {
              name = "";
              url = "https://www.virustotal.com";
            }
            {
              name = "";
              url = "https://www.youtube.com";
            }
            {
              name = "";
              url = "https://www.twitch.tv";
            }
            {
              name = "";
              url = "https://monkeytype.com";
            }
            {
              name = "";
              url = "https://detexify.kirelabs.org";
            }
            {
              name = "";
              url = "https://tinywow.com";
            }
            {
              name = "";
              url = "https://docs.google.com";
            }
            {
              name = "";
              url = "https://invapi.hostkey.ru";
            }
            {
              name = "";
              url = "https://online-edu.mirea.ru";
            }
            {
              name = "";
              url = "https://lk.mirea.ru";
            }
            {
              name = "";
              url = "https://excalidraw.com";
            }
            {
              name = "";
              url = "https://overleaf.com";
            }
            {
              name = "";
              url = "https://www.desmos.com/calculator";
            }
            {
              name = "";
              url = "https://www.geogebra.org/3d";
            }
            {
              name = "";
              url = "https://octave-online.net";
            }
            {
              name = "";
              url = "https://www.wolframalpha.com";
            }
            {
              name = "";
              url = "https://discord.com";
            }
            {
              name = "";
              url = "https://search.nixos.org/packages";
            }
          ];
        }
      ];
    };
  };
}