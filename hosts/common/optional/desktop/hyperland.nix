{ config, pkgs, inputs, ... }:
{
    #services.xserver.enable = true;
    #services.xserver.displayManager.sddm.enable = true;
    #services.xserver.displayManager.sddm.hyprland.enable = true;
  services = {
    xserver = {
      enable = true;
      layout = "de";
      xkbVariant = "";
      excludePackages = [ pkgs.xterm ];
      libinput.enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    dbus.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    gnome = {
      sushi.enable = true;
      gnome-keyring.enable = true;
    };
  };

  programs.hyprland = {
          enable = true;
          nvidiaPatches = true;
          #xwayland.enable = true;
          };


    environment.systemPackages = with pkgs; [
 ];

xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
