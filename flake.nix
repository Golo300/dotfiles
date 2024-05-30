{
  description = "My Persopnal dotfiles";

  inputs = {

    # nix packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # agenix for encrypting secrets
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # formatter for *.nix files
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, treefmt-nix, agenix, home-manager, ... }@inputs:
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

        };

      homeConfigurations =
        {

          "timl" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home/timl ];
            extraSpecialArgs = { inherit inputs; };
          };



        };


    };
}
