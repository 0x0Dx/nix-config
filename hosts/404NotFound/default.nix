{ config, pkgs, home-manager, ... }@args: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/fhs-fonts.nix
    ../../modules/hyprland.nix
    ../../modules/gui-apps.nix
    ../../modules/core-desktop.nix
    ../../modules/user_groups.nix
    ../../modules/gaming.nix
  ];

  nix.settings.trusted-users = [ "root" "oxod" ];

  nixpkgs.overlays = import ../../overlays args;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  boot.supportedFilesystems = [ 
    "ext4"
    "btrfs"
    "xfs"
    "ntfs"
    "fat" "vfat" "exfat"
    "cifs"
  ];

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
