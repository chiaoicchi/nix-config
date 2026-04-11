{ pkgs, ... }:
{
  imports = [
    ./claude-code
    ./git.nix
    ./neovim
    ./shell.nix
    ./multiplexer.nix
    ./ssh.nix
    ./terminal.nix
  ];

  home.packages = with pkgs; [
    curl
    jq
    nerd-fonts.hack
  ];
}
