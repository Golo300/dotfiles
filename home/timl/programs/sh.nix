{ config, lib, pkgs, ... }:
let
  myAliases =
    {
      ll = "ll -l";
      ".." = "cd ..";
      "conf" = "cd /etc/nixos";
    };
in
{
  programs.bash =
    {
      enable = true;
      shellAliases = myAliases;
    };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

}
