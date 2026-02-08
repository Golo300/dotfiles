{ config, pkgs, inputs, ... }:
{
  imports =
    [
      # ./hyperland-conf/waybar.nix
      # ./hyprpanel.nix
    ];

  gtk = {
    enable = true;

    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };

    iconTheme = {
      package = pkgs.dracula-icon-theme;
      name = "Dracula";
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/wm/preferences" =
      {
        button-layout = "appmenu:";
      };
  };

  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
      font-size = 32;
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
      pkgs.firefox
      pkgs.swww
      pkgs.qt5.qtwayland
      pkgs.qt6.qmake
      pkgs.qt6.qtwayland
      pkgs.eww
      pkgs.xorg.xcursorthemes
      pkgs.wl-clipboard
      pkgs.grim
    ];
  services.flameshot = {
    enable = true;
  };


  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyperland-conf/hyprland.conf;
  };
}
