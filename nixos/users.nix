{ config, pkgs, lib, ... }: let 
  username = config.var.username;
  sshKeyPath = "/home/${username}/.ssh/github.pub";
  sshKeyExists = builtins.pathExists sshKeyPath;
in {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = ["networkmanager" "wheel"];
      openssh.authorizedKeys.keys = lib.optional sshKeyExists (builtins.readFile sshKeyPath);
    };
  };
}