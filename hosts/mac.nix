{ username, ... }:
{
  imports = [ ../modules/home/gui.nix ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
