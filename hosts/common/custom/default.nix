{ config, inputs, pkgs, agenix, git-cloner, lib, ... }:
{
  imports = [
    ./git-cloner.nix
  ];

  config.git-cloner =
    {
      enable = false;
      targetDirectory = "/home/timl/SC-test";
      repositories =
        [
          "git@github.com:Golo300/Test.git"
        ];
    };
}
