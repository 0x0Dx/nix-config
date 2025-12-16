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

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = ["nvidia"];
  hardware.opengl.enable = true;
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = true;
  };

  system.stateVersion = "25.11";
}

