{ config, pkgs, inputs, ... }:
{
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.hyprland.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtwayland
  ];

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --user-menu \
            --cmd "Hyprland"
        '';
      };
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
