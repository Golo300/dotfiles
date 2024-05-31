{ config, lib, pkgs, ... }:
let
  myAliases =
    {
      "ll" = "ls -la";
      ".." = "cd ..";
      "conf" = "cd ~/dotfiles";
    };
in
{
  programs.bash =
    {
      enable = true;
      shellAliases = myAliases;
    };
}
