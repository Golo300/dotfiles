{ config, pkgs, inputs, ... }:
{
  imports = 
  [
    ./hyperland-conf/waybar.nix
  ];
  gtk.enable = true;

  # Cursor Theme
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  # GTK Theme
  gtk.theme.package = pkgs.adapta-gtk-theme;
  gtk.theme.name = "Adapta-Nokto";

  # Icon Theme
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";

  programs.swaylock = {
  enable = true;
  settings = {
    extraOptions = "--effect-blur 7x5 --ring-color #FFFFFF"; 
    };
  };
  home.packages = 
  [
    pkgs.kitty
    pkgs.hyprpaper
    pkgs.rofi
    pkgs.firefox-wayland
    pkgs.swww
    pkgs.qt5.qtwayland
    pkgs.qt6.qmake
    pkgs.qt6.qtwayland
    pkgs.dunst
    pkgs.eww
    pkgs.wofi
  ];


  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyperland-conf/hyprland.conf;
};
}
