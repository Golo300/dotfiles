{ pkgs, ... }:
{
    programs.hyprpanel = {
        enable = true;
        settings = {
            bar.layouts = {
                "0" = {
                    left = [ "dashboard" "workspaces" "windowtitle"];
                    middle = [ "clock" ];
                    right = [
                        "network"
                        "volume"
                        "bluetooth"
                        "battery"
                        "media"

                        "notifications"
                    ];
                };
            };

            bar.launcher.autoDetectIcon = true;
            bar.workspaces.show_icons = false;
            bar.workspaces.show_numbered = true;
            bar.clock.format = "%a %b %d  %H:%M";

            menus.clock.time.military = false;
            menus.clock.time.hideSeconds = true;
            menus.clock.weather.unit = "metric";
            menus.dashboard.directories.enabled = false;
            menus.dashboard.shortcuts.enabled = true;

            wallpaper.enable = false;
            theme = "Dracula";
        };
        systemd.enable = false;
    };
}
