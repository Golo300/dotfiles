{ config, lib, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      james-yu.latex-workshop
      vscodevim.vim
    ];
    userSettings = {
      "terminal.integrated.fontFamily" = "Hack";
    };
  };
}
