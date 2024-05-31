{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      # shortcuts
      "ll" = "ls -la";
      ".." = "cd ..";
      "conf" = "cd ~/dotfiles";
      # other stuff
      hibernate = "systemctl hibernate";
    };
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "battery"
      ];
      theme = "agnoster";
    };
  };
}
