{ config, inputs, ... }: let
  autoGarbageCollector = config.var.autoGarbageCollector;
in {
  security.sudo.extraRules = [
    {
      users = [config.var.username];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    channel.enable = false;
    extraOptions = ''
      warn-dirty = false
    '';
    settings = {
      download-buffer-size = 262144000;
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://cache.nixos.org?priority=10"
      ];
    };
    gc = {
      automatic = autoGarbageCollector;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}