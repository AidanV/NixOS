{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    weekly.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-23.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      weekly,
      home-manager,
      nixvim,
      caelestia-shell,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            weekly-pkgs = import weekly {
              system = "x86_64-linux";
            };
          };
          modules = [
            ./configuration.nix
            {
              nixpkgs.overlays = [
                (final: prev: {
                  caelestia-shell = caelestia-shell.packages.${system}.caelestia-shell;
                  caelestia-cli = caelestia-shell.inputs.caelestia-cli.packages.${system}.caelestia-cli;
                })
              ];
            }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.aidan = import ./home;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                weekly-pkgs = import weekly {
                  inherit system;
                };
              };
            }
            #inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
