{ pkgs, ... }:
{
  programs.hyprpanel = {
    enable = true;
    settings = {
      bar = {
        clock.format = "%a %b %d  %H:%M";
        launcher.autoDetectIcon = true;

        layouts = {
          "0" = {
            left = [ "dashboard" "workspaces" "windowtitle" ];
            middle = [ "clock" ];
            right = [ "network" "volume" "bluetooth" "battery" "media" "notifications" ];
          };
        };

        workspaces = {
          show_icons = false;
          show_numbered = true;
        };
      };

      menus = {
        clock = {
          time = {
            hideSeconds = true;
            military = false;
          };
          weather.enabled = false;
        };

        dashboard = {
          directories.enabled = false;
          shortcuts.enabled = true;
        };
      };

      theme = "Dracula";

      wallpaper.enable = true;

      "menus.dashboard.shortcuts.left.shortcut4.command" = "wofi --show drun";
      "menus.dashboard.shortcuts.left.shortcut2.command" = "spotify";
    };
    systemd.enable = false;
  };
}
