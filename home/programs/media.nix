{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pulsemixer

    ffmpeg-full

    # images
    viu
    imv
    imagemagick
    graphviz

    # creative
    blender
    gimp
    inkscape 
    krita

    # 3d printing, eletrical engineering
    kicad
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };
    obs-studio.enable = true;
  };

  services = {
    playerctld.enable = true;
  };
}