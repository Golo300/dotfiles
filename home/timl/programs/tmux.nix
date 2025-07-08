{ pkgs, ... }: {
  programs.tmux =
    {
      enable = true;
      clock24 = true;
      escapeTime = 0;
      keyMode = "vi";
      plugins = with pkgs;[
            {
                plugin = tmuxPlugins.dracula;
                extraConfig = ''
                    set -g @plugin 'dracula'
                    set -g @dracula-fixed-location "Herbrechtingen"
                    set -g @dracula-network-hosts "center"
                '';
            }
            ];
    };
}
