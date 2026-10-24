{ pkgs, ... }:
{
  services.wayle = {
    enable = true;

    settings = {
      bar = {
        location = "top";

        layout = [
          {
            monitor = "*";
            left = [ "dashboard" "hyprland-workspaces" "window-title" ];
            center = [ "clock" ];
            right = [ "network" "volume" "media" "notification" ];
          }
        ];
      };

      modules = {
        clock.format = "%a %b %d  %H:%M";

        # Falls du Icons statt Nummern willst: hier nachschauen
        # hyprland-workspaces = { app-icons-show = false; };
      };

      # Dracula-Palette
      styling = {
        theme-provider = "wayle";
        palette = {
          bg = "#282a36";
          fg = "#f8f8f2";
          fg-muted = "#6272a4";
          elevated = "#44475a";
          primary = "#bd93f9";
        };
      };
    };
  };
}
