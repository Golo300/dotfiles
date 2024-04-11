{ config, pkgs, inputs, ... }:
{
  # Cursor Theme
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  # GTK Theme
  gtk.theme.package = pkgs.adapta-gtk-theme;
  gtk.theme.name = "Adapta-Nokto";

  # Icon Theme
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";


  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyperland-conf/hyprland.conf;
};
}
