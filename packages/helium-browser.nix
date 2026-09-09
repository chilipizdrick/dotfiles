{
  stdenv,
  lib,
  appimageTools,
  fetchurl,
  copyDesktopItems,
  withVpnDesktopFile ? false,
}: let
  pname = "helium-browser";
  version = "0.16.6.1";

  architectures = {
    "x86_64-linux" = {
      arch = "x86_64";
      hash = "sha256-T29e5QpXsFYADvSsNcti2LXqLaCUjB5mLYEnHtpxO/Q=";
    };
  };

  src = let
    inherit (architectures.${stdenv.hostPlatform.system}) arch hash;
  in
    fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
      inherit hash;
    };

  appimageContents = appimageTools.extract {inherit pname src version;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    nativeBuildInputs = [copyDesktopItems];

    extraInstallCommands =
      ''
        install -D -m 644 ${appimageContents}/helium.desktop $out/share/applications/helium.desktop

        substituteInPlace $out/share/applications/helium.desktop \
          --replace 'Exec=helium %U' "Exec=$out/bin/${pname} --hide-crash-restore-bubble %U"

          cp -r ${appimageContents}/usr/share/icons $out/share
      ''
      + (
        if withVpnDesktopFile
        then ''
          cp $out/share/applications/helium.desktop $out/share/applications/helium-vpn.desktop

          substituteInPlace $out/share/applications/helium-vpn.desktop \
            --replace 'Name=Helium' 'Name=Helium (VPN)' \
            --replace "Exec=$out/bin/${pname} --hide-crash-restore-bubble %U" \
                      "Exec=vpn-launch $out/bin/${pname} --hide-crash-restore-bubble --user-data-dir=.config/helium-vpn --class=helium-vpn %U"

          echo "StartupWMClass=helium-vpn" >> $out/share/applications/helium-vpn.desktop
        ''
        else ""
      );

    meta = {
      platforms = lib.attrNames architectures;
    };
  }
