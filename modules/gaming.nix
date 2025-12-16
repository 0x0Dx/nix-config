{ pkgs, nix-gaming, config, ... }: {
  imports = [
    nix-gaming.nixosModules.pipewireLowLatency
    nix-gaming.nixosModules.platformOptimizations
  ];

  programs.steam = {
    enable = true;
    package = pkgs.steam;
    gamescopeSession.enable = true;
    protontricks.enable = true;
    extest.enable = true;
  };

  services.pipewire.lowLatency.enable = true;
  programs.steam.platformOptimizations.enable = true;

  programs.gamemode.enable = true;
}