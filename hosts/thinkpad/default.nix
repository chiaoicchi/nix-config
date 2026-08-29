{ pkgs, ... }:
{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ./networking.nix

    ../../modules/nixos
    ../../modules/nixos/desktop.nix
  ];

  my = {
    username = "chiaoi";
    git = {
      name = "chiaoicchi";
      email = "182973681+chiaoicchi@users.noreply.github.com";
    };
  };

  system.stateVersion = "26.05";

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "amdgpu.dcdebugmask=0x410" ];
  };
}
