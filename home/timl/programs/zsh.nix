{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      # shortcuts
      "ll" = "ls -la";
      ".." = "cd ..";
      "conf" = "cd ~/dotfiles\n nvim";
      # other stuff
      hibernate = "systemctl hibernate";
    };
    enableCompletion = true;

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
      ];
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "battery"
      ];
      theme = "bira";
    };
  };
}
