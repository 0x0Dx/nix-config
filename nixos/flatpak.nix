{ pkgs, config, lib, ... }: let
  username = config.var.username;
in {
  services.flatpak.enable = true;

  environment.sessionVariables = {
    XDG_DATA_DIRS = lib.mkAfter [
      "/home/${username}/.local/share/flatpak/exports/share"
      "/var/lib/flatpak/exports/share"
    ];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [ flatpak ];
}