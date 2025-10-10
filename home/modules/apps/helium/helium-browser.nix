{
  stdenv,
  lib,
  appimageTools,
  fetchurl,
  makeDesktopItem,
  copyDesktopItems,
}: let
  pname = "helium-browser";
  version = "0.5.3.1";

  architectures = {
    "x86_64-linux" = {
      arch = "x86_64";
      hash = "sha256-uPFO1xvL0Uc4eBWZ7yvWoKErUpbyrUDyOMIboOVlzxw=";
    };
  };

  src = let
    inherit (architectures.${stdenv.hostPlatform.system}) arch hash;
  in
    fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
      inherit hash;
    };

  appimageContents = appimageTools.extractType2 {inherit pname src version;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    nativeBuildInputs = [copyDesktopItems];

    extraInstallCommands = ''
      install -D -m 644 ${appimageContents}/helium.desktop $out/share/applications/helium.desktop

      substituteInPlace $out/share/applications/helium.desktop \
        --replace 'Exec=AppRun' "Exec=$out/bin/${pname}"

      cp -r ${appimageContents}/usr/share/icons $out/share
    '';

    # desktopItems = [
    #   (makeDesktopItem {
    #     type = "Application";
    #     name = "Helium";
    #     desktopName = "Helium";
    #     genericName = "Web Browser";
    #     exec = "helium-browser %U";
    #     terminal = false;
    #     icon = "helium";
    #     categories = ["Network" "WebBrowser"];
    #     mimeType = [
    #       "application/pdf"
    #       "application/rdf+xml"
    #       "application/rss+xml"
    #       "application/xhtml+xml"
    #       "application/xhtml_xml"
    #       "application/xml"
    #       "image/gif"
    #       "image/jpeg"
    #       "image/png"
    #       "image/webp"
    #       "text/html"
    #       "text/xml"
    #       "x-scheme-handler/http"
    #       "x-scheme-handler/https"
    #     ];
    #   })
    # ];

    meta = {
      platforms = lib.attrNames architectures;
    };
  }
