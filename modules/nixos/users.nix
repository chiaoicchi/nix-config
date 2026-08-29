{ config, pkgs, ... }:
{
  programs.zsh.enable = true;

  users.users = {
    ${config.my.username} = {
      extraGroups = [ "wheel" "networkmanager" ];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };
}
