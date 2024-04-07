{ config, inputs, pkgs, neovim, ... }:

{
  imports =
    [
      ./programs/sh.nix
      ./programs/git.nix
      ./programs/vscode.nix
      ./programs/neovim.nix
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

  home.username = "timl";
  home.homeDirectory = "/home/timl";


  home.stateVersion = "24.05";

  home.packages = [
    pkgs.hello
    pkgs.discord
    pkgs.spotify
    pkgs.keepassxc
    pkgs.p3x-onenote
    pkgs.legendary-gl
    pkgs.prismlauncher
    pkgs.obsidian
    pkgs.fceux
    pkgs.jetbrains.clion
    pkgs.drawio
    pkgs.gccgo
  ];

  home.file = {
    # ".screenrc".source = dotfiles/screenrc;

    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
