{config, pkgs, ...}: {
  users.groups = {
    oxod = {};
    docker = {};
    wireshark = {};
  };
  
  users.users.oxod = {
    isNormalUser = true;
    description = "OxOD";
    extraGroups = [ "oxod" "users" "networkmanager" "wheel" "docker" "wireshark" "adbusers" ];
  };
}