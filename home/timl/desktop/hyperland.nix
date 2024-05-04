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
  color = "000000";
  font-size = 24;
  indicator-idle-visible = false;
  indicator-radius = 60;
  inside-color = "000000";
  #line-color = "253243";
  key-hl-color = "87c1cf";
  ring-color = "6081ac";
  show-failed-attempts = false;
  image = "/home/timl/dotfiles/home/timl/wallpaper/nixos.jpg"; 
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
