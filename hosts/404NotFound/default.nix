{ config, pkgs, home-manager, nur, ... }: {
  imports = [
    nur.nixosModules.nur

    ./hardware-configuration.nix

    ../../modules/fhs-fonts.nix
    ../../modules/hyprland.nix
    ../../modules/nur-packages.nix
    ../../modules/system.nix
    ../../modules/user_groups.nix
    ../../modules/gaming.nix
  ];

  nixpkgs.overlays = import ../../overlays args;

  nixpkgs.config.allowUnfree = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
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

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vulkan-loader
    ];
  };

  system.stateVersion = "25.11";
}
