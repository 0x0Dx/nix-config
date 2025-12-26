{ lib, pkgs, config, ... }: {
  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 17;
      gaps-in = 8;
      gaps-out = 8*2;
      active-opacity = 0.97;
      inactive-opacity = 0.94;
      blur = true;
      border-size = 3;
      animation-speed = "fast";
      fetch = "none";
      textColorOnWallpaper = config.lib.stylix.colors.base01;
      bar = {
        position = "top";
        transparent = true;
        transparentButton = false;
        floating = true;
      };
    };
    description = "Theme configuration options";
  };

  config.stylix = {
    enable = true;
    base16Scheme = {
      base00 = "0F0F15";
      base01 = "15151A";
      base02 = "313244";
      base03 = "45475a";
      base04 = "585b70";
      base05 = "cdd6f4";
      base06 = "f5e0dc";
      base07 = "b4befe";
      base08 = "f38ba8";
      base09 = "fab387";
      base0A = "f9e2af";
      base0B = "a6e3a1";
      base0C = "94e2d5";
      base0D = "89b4fa";
      base0E = "cba6f7";
      base0F = "f2cdcd";
    };
    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 20;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
      sansSerif = {
        package = pkgs.source-sans-pro;
        name = "Source Sans Pro";
      };
      serif = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 13;
        terminal = 13;
      };
    };
    polarity = "dark";
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/0x0Dx/wallpapers/refs/heads/main/japan-houses.png";
      sha256 = "sha256-BeTFz+WeulDt5ixg5ni09J439PxMnofWnJz5PGEUgf8=";
    };
  };
}