{ pkgs, config, lib, ... }: {
  imports = [
    ./wayland-apps.nix
  ];

  home.file.".config/hypr" = {
    source = ./hypr-conf;
    recursive = true;
  };
  home.file.".config/gtk-3.0" = {
    source = ./gtk-3.0;
    recursive = true;
  };
  home.file.".gtkrc-2.0".source = ./gtkrc-2.0;
  home.file.".config/hypr/wallpapers/wallpaper.png".source = ../wallpapers/wallpaper.png;

  fonts.fontconfig.enable = true;

  systemd.user.sessionVariables = {
    "NIXOS_OZONE_WL" = "1";
    "MOZ_ENABLE_WAYLAND" = "1"; 
    "MOZ_WEBRENDER" = "1";

    "LIBVA_DRIVER_NAME" = "nvidia";
    "XDG_SESSION_TYPE" = "wayland";
    "GBM_BACKEND" = "nvidia-drm";
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "WLR_EGL_NO_MODIFIRES" = "1";
  };

  xresources.properties = {
    "Xft.dpi" = 162;
  };

  home.pointerCursor = {
    name = "Qogir-dark";
    package = pkgs.qogir-theme;
    size = 64;
  };
}