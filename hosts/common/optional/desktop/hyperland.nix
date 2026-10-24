{ config, pkgs, inputs, lib, ... }:
let
    theme = "border=#6272a4;text=#f8f8f2;prompt=#8be9fd;time=#f1fa8c;action=#ff79c6;button=#6272a4;container=#282a36;input=#50fa7b;greet=#f8f8f2";
in  {
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.hyprland.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    qt5.qtbase
    qt5.qtwayland
  ];

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.greetd = {
    enable = true;
    settings.default_session = {
      user = "greeter";
      command = lib.concatStringsSep " " [
        "${pkgs.tuigreet}/bin/tuigreet"
        "--time"
        "--asterisks"
        "--user-menu"
        "--cmd start-hyprland"
        "--theme '${theme}'"
      ];
    };
  };

  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "systemd.show_status=false"
    "udev.log_level=3"
  ];

  boot.consoleLogLevel = 0;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
