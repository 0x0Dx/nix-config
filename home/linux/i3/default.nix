{ pkgs, config, ... }: {
  imports = [
    ./x11-apps.nix
  ];

  home.file.".config/i3/wallpaper.png".source = ../wallpapers/wallpaper.png;
  home.file.".config/i3/config".source = ./config;
  home.file.".config/i3/i3blocks.conf".source = ./i3blocks.conf;
  home.file.".config/i3/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };
  home.file.".config/rofi" = {
    source = ./rof-conf;
    recursive = true;
  };
  
  fonts.fontconfig.enable = true;

  systemd.user.sessionVariables = {
    "LIBVA_DRIVER_NAME" = "nvidia";
    "GBM_BACKEND" = "nvidia-drm";
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
  };

  xresources.properties = {
    "Xft.dpi" = 162;
    "*.dpi" = 162;
  };

  home.pointerCursor = {
    name = "Qogir-dark";
    package = pkgs.gogir-theme;
    size = 64;
  };
}
