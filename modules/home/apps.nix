{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    slack
    discord
  ];
}
