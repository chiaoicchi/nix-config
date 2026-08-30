{ config, inputs, ... }:
{
  home-manager = {
    users.${config.my.username}.imports = [
      ../home
    ];

    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
