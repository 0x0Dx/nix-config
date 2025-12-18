{ config, pkgs, ... }: {
  imports = [
    ../common

    ./x11

    ./fcitx5
    ./desktop

    ./common/alacritty
    ./common/development.nix
    ./common/shell.nix
    ./common/ssh.nix
    ./common/system-tools.nix
    ./common/xdg.nix
  ];

  home = {
    username = "oxod";
    homeDirectory = "/home/oxod";

    stateVersion = "25.11";
  };
  
  programs.home-manager.enable = true;
}