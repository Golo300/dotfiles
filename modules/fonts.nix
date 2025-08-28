{ pkgs, lib, ... }:
{
  fonts.packages = with pkgs; [
    corefonts
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
  ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "corefonts"
  ];
}
