{ pkgs, inputs, config, ... }:
{
  users.users.timl = {
    isNormalUser = true;
    description = "Tim Lanzinger";
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" ];
    packages = with pkgs; [ hello ];
  };
}
