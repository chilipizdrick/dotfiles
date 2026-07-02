{
  stdenv,
  lib,
  makeWrapper,
  python3,
  pipewire,
}:
stdenv.mkDerivation {
  pname = "pw-connect";
  version = "1.0.0";

  src = ./.;

  nativeBuildInputs = [makeWrapper];
  buildInputs = [python3];

  installPhase = ''
    mkdir -p $out/bin
    cp pw-connect.py $out/bin/pw-connect
    chmod +x $out/bin/pw-connect
    wrapProgram $out/bin/pw-connect \
      --prefix PATH : ${lib.makeBinPath [pipewire]}
  '';
}
