{ pkgs, ... }: {
  programs.tmux =
    {
      enable = true;
      clock24 = true;
      escapeTime = 0;
      keyMode = "vi";
      plugins = with pkgs;[
            {
                plugin = tmuxPlugins.nord;
                extraConfig = ''
                    set -g @plugin 'nordtheme/nord-tmux'
                '';
            }
            ];
    };
}
