{ pkgs, config, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    bottles
    lutris
    mangohud
    prismlauncher
    gamescope
    goverlay
    vkbasalt
    wine
    protonup-qt
    protonup-ng
    winetricks
    protontricks
    dxvk
    vkd3d
    vkd3d-proton
    jdk17
  ];

  hardware.steam-hardware.enable = true;
  services.joycond.enable = true;
  hardware.xone.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    DXVK_ASYNC = "1";
    WINE_FULLSCREEN_FSR = "1";
    WINE_FULLSCREEN_FSR_STRENGTH = "2";
    MANGOHUD = "1";
  };
}