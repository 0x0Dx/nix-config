{ config, pkgs, ... }: let 
  username = config.var.username;
in {
  virtualisation.docker.enable = false;

  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
    dockerSocket.enable = false;
    defaultNetwork.settings.dns_enabled = true;
  };
  environment.variables.DBX_CONTAINER_MANAGER = "podman";
  users.extraGroups.podman.members = ["${username}"];

  environment.systemPackages = with pkgs; [
    nvidia-docker
    nerdctl

    distrobox
    qemu
    lima
    lima-additional-guestagents

    podman-compose
    podman-tui

    docker-client
    docker-compose
    lazydocker
    docker-credential-helpers
  ];
}