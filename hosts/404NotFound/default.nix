{ config, pkgs, ... }: {
  imports = [
    ../../modules/system.nix
    ../../modules/i3.nix
    
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
    };
  };

  networking.hostName = "404NotFound";
  networking.networkmanager.enable = true;

  system.stateVersion = "25.11";
}

