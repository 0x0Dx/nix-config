{ pkgs, nixpkgs-stable, config, ... }: let
  pkgs-stable = import nixpkgs-stable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs-stable; [
    firefox-wayland
    google-chrome
  ];

  programs.vscode = {
    enable = true;
    package = pkgs-stable.vscode;
  };
}