{ config, pkgs, inputs, ... }:
{
  services.xserver.enable = true;
    #services.xserver.displayManager.sddm.enable = true;
    #services.xserver.displayManager.sddm.wayland.enable = true;


  programs.hyprland = {
          enable = true;
          nvidiaPatches = true;
          xwayland.enable = true;
          };


    environment.systemPackages = with pkgs; [
    kitty
    hyprpaper
    rofi
    firefox-wayland
    swww
   qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
   waybar
    dunst
    eww
    wofi
  ];

xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
