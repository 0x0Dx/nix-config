{ config, ... }: {
  imports = [
    ../../nixos/audio
    ../../nixos/boot
    ../../nixos/desktop
    ../../nixos/graphics
    ../../nixos/networking
    ../../nixos/packages
    ../../nixos/system

    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  system.stateVersion = "25.05";
}