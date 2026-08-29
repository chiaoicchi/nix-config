{ config, ... }:
{
  users.users = {
    ${config.my.username} = {
      extraGroups = [ "wheel" "networkmanager" ];
      isNormalUser = true;
    };
  };
}
