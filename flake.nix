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
      username = "chiaoi";
      gitUsername = "chiaoicchi";
      gitEmail = "182973681+chiaoicchi@users.noreply.github.com";

      mkHome =
        { system, hostModule }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          extraSpecialArgs = { inherit username gitUsername gitEmail; };
          modules = [
            ./modules/home/default.nix
            hostModule
          ];
        };

    in
    {
      homeConfigurations = {
        # macOS (Apple Silicon)
        "${username}@mac" = mkHome {
          system = "aarch64-darwin";
          hostModule = ./hosts/mac.nix;
        };
      };
    };
}
