{ ... }: {
  programs.tmux =
    {
      enable = true;
      clock24 = true;
      escapeTime = 0;
      keyMode = "vi";
      terminal = "screen-256color";
    };
}
