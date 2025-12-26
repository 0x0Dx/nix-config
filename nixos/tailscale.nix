{ config, inputs, ... }: let
  username = config.var.username;
in {
  security.sudo.extraRules = [
    {
      users = [username];
      commands = [
        {
          command = "/etc/profiles/per-user/${username}/bin/tailscale";
          options = ["NOPASSWD"];
        }
        {
          command = "/run/current-system/sw/bin/tailscale";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  services.tailscale = {
    enable = true;
    package = inputs.nixpkgs-stable.legacyPackages.x86_64-linux.tailscale;
    openFirewall = true;
  };

  networking.firewall = {
    trustedInterfaces = ["tailscale0"];
    checkReversePath = "loose";
  };
}