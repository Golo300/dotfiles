{ pkgs, lib, ... }:

let
  version = "1.0.0";

  instalectronAppImage = pkgs.fetchurl {
    url = "https://github.com/Hannes-Schuck/instalectron/releases/download/v${version}/Instalectron-${version}.AppImage";
    sha256 = "sha256-bpxJtpRbuEy77XYCb9/5fKJ6cktYccmDJGQROWq8vw0=";
  };

  instalectron = pkgs.appimageTools.wrapType2 {
    pname = "instalectron";
    version = version;
    src = instalectronAppImage;
  };
in
{
  home.packages = [
    instalectron
  ];

  xdg.desktopEntries.instalectron = {
    name = "Instalectron";
    exec = "instalectron";
    icon = "camera";
    categories = [ "Utility" ];
  };
}
