{ pkgs, ... }:
{
  imports = [
    ./apps.nix
    ./fcitx5
    ./git.nix
    ./wm
    ./ssh.nix
  ];

  home.stateVersion = "26.05";
  xdg.enable = true;
}
