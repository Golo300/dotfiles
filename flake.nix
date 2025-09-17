{
  description = "My Persopnal dotfiles";

  inputs = {

    # nix packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # agenix for encrypting secrets
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    git-cloner.url = "github:Golo300/git-cloner";

    # formatter for *.nix files
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  nixConfig = {
    substituters = [
      "https://cache.nixos.org/"
      "https://cuda-maintainers.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs = { self, nixpkgs, treefmt-nix, agenix, home-manager, git-cloner, ... }@inputs:
    let
      lib = nixpkgs.lib // home-manager.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    in
    {
      inherit lib;

      formatter.${system} = treefmtEval.config.build.wrapper;
      checks.${system}.formatter = treefmtEval.config.build.check self;

      nixosConfigurations =
        {
          amboss-oktagon = lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/amboss-oktagon
              agenix.nixosModules.default
              {
                _module.args.agenix = agenix.packages.${system}.default;
              }
              inputs.home-manager.nixosModules.default
            ];
          };
          pc = lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/pc
              agenix.nixosModules.default
              {
                _module.args.agenix = agenix.packages.${system}.default;
              }
              inputs.home-manager.nixosModules.default
            ];
          };
        };
      homeConfigurations =
        {
          "timl" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home/timl/laptop.nix ];
            extraSpecialArgs = { inherit inputs; };
          };
        };
      homeConfigurations =
        {
          "timlpc" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home/timl/pc.nix ];
            extraSpecialArgs = { inherit inputs; };
          };
        };
    };
}
