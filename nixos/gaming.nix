{ pkgs, config, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  programs.lutris.enable = true;

  programs.wine = {
    enable = true;
    wineWowPackages = "wine-ge";
  };

  programs.mangohud.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    bottles
    prismlauncher
    gamescope
    goverlay
    vkbasalt
    proton-ge-bin
    protonup
    winetricks
    protontricks
    dxvk
    vkd3d
    vkd3d-proton
    dxvk-nvapi
    jdk17
  ];

  hardware.steam-hardware.enable = true;
  services.joycond.enable = true;
  hardware.xone.enable = true;
  hardware.dualsense.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    LD_PRELOAD = "\${pkgs.gamemode.lib}/lib/libgamemodeauto.so";
    DXVK_ASYNC = "1";
    WINE_FULLSCREEN_FSR = "1";
    WINE_FULLSCREEN_FSR_STRENGTH = "2";
    MANGOHUD = "1";
  };
}