{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    blender
    gimp
    inkscape
    krita
    musescore
    reaper
  ];

  programs = {
    obs-studio.enable = true;
  };
}