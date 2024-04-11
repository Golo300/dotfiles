{ pkgs, inputs, config, ... }:
{
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/timl/dotfiles/home/timl/wallpaper/chill.jpg"; #TODO fix this
      picture-uri-dark = "file:///home/timl/dotfiles/home/timl/wallpaper/chill.jpg"; # TODO fix this

    };
    "org/gnome/desktop/wm/preferences" =
      {
        button-layout = "appmenu:minimize,maximize,close";
      };
  };
}
