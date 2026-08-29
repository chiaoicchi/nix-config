{ pkgs, ... }:
{
  imports = [
    ./apps.nix
    ./cli.nix
    ./fcitx5
    ./git.nix
    ./shell.nix
    ./ssh.nix
    ./wm
  ];

  home.stateVersion = "26.05";
  xdg.enable = true;
}
