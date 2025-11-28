{
  stdenv,
  lib,
  appimageTools,
  fetchurl,
  copyDesktopItems,
}: let
  pname = "helium-browser";
  version = "0.6.7.1";

  architectures = {
    "x86_64-linux" = {
      arch = "x86_64";
      hash = "sha256-fZTBNhaDk5EeYcxZDJ83tweMZqtEhd7ws8AFUcHjFLs=";
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

    meta = {
      platforms = lib.attrNames architectures;
    };
  }
