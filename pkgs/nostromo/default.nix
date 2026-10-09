{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "nostromo";
  version = "0.14.1";
  src = fetchurl {
    url = "https://github.com/pokanop/nostromo/releases/download/v${version}/nostromo_${version}_Linux_x86_64.tar.gz";
    sha256 = "sha256-";
  };
  sourceRoot = ".";
  installPhase = ''
    runHook preInstall
    install -Dm755 nostromo $out/bin/nostromo
    runHook postInstall
  '';
  meta = with lib; {
    description = "CLI to manage aliases through simple commands to add and remove scoped aliases and substitutions";
    homepage = "https://nostromo.sh";
    license = licenses.mit;
    mainProgram = "nostromo";
    platforms = [ "x86_64-linux" ];
  };
}
