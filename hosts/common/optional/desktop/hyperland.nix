{ config, pkgs, inputs, ... }:
{
  #services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.hyprland.enable = true;
  services = {
    xserver = {
      enable = true;
      xkb.layout = "de";
      xkb.variant = "";
      excludePackages = [ pkgs.xterm ];
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    libinput.enable = true;
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
    #xwayland.enable = true;
  };


  environment.systemPackages = with pkgs; [
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
