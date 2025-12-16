{ config, pkgs, ... }: {
  imports = [
    ../../modules/system.nix
    ../../modules/i3.nix
    ../../modules/fcitx5
    
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

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
  };
  hardware.graphics.enable = true;

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  system.stateVersion = "25.11";
}

