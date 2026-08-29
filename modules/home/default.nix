{
  imports = [
    ./apps.nix
    ./cli.nix
    ./editor
    ./fcitx5
    ./git.nix
    ./shell.nix
    ./ssh.nix
    ./wm
  ];

  home.stateVersion = "26.05";
  xdg.enable = true;
}
