{ pkgs, ... }:

{
  programs.zsh =
    let
      select-project = import ../../../pkgs/select-project.nix { inherit pkgs; };

    in
    {
      enable = true;
      shellAliases = {
        # shortcuts
        "ll" = "ls -la";
        ".." = "cd ..";
        "conf" = "cd ~/dotfiles\n nvim";
        # other stuff
        hibernate = "systemctl hibernate";
        repo = "cd $(reporer)";
        sp = ''${select-project}/bin/select-project'';

        wgu = "systemctl start wg-quick-wg0";
        wgd = "systemctl stop wg-quick-wg0";
        wgs = "systemctl status wg-quick-wg0";
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
