{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    pulsemixer
    imv 
    nvtop
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };
  };

  services = {
    playerctld.enable = true;
  };
}