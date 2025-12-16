{ config, pkgs, ... }: {
  imports = [
    ./fcitx5
    ./i3
    ./programs
    ./rofi
    ./shell
  ];

  home = {
    username = "oxod";
    homeDirectory = "/home/oxod";

    stateVersion = "25.11";
  };
  
  programs.home-manager.enable = true;
}
