{ config, ... }:
{
  home-manager = {
    users.${config.my.username}.imports = [
      ../home
    ];

    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
