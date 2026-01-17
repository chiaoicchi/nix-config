{
  description = "My home-manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:

    let
      secrets = import ./secrets.nix;

      commonSpecialArgs = {
        inherit (secrets) username gitUsername gitEmail;
      };

      mkHome =
        { system, hostModule }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          extraSpecialArgs = commonSpecialArgs;
          modules = [
            ./modules/home/default.nix
            hostModule
          ];
        };

    in
    {
      homeConfigurations = {
        # macOS (Apple Silicon)
        "${secrets.username}@mac" = mkHome {
          system = "aarch64-darwin";
          hostModule = ./hosts/mac.nix;
        };
      };
    };
}
