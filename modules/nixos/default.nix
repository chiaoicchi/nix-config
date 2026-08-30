{ lib, pkgs, ... }:
{
  imports = [
    ./docker.nix
    ./fonts.nix
    ./home-manager.nix
    ./i18n.nix
    ./nix.nix
    ./users.nix
  ];

  options.my = {
    username = lib.mkOption { type = lib.types.str; };
    git = {
      name = lib.mkOption { type = lib.types.str; };
      email = lib.mkOption { type = lib.types.str; };
    };
  };

  config = {
    environment.systemPackages = with pkgs; [
      git
      vim
    ];
  };
}
