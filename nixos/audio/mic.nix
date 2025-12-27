{ config, pkgs, ... }: let
  username = config.var.username;
in {
  services.pipewire.enable = true;

  environment.systemPackages = with pkgs; [
    easyeffects
    
    pavucontrol
    pulsemixer
    
    audacity
  ];

  hardware.pulseaudio.extraConfig = ''
    load-module module-echo-cancel
    load-module module-udev-detect tsched=0
  '';

  services.pipewire.extraConfig = {
    pipewire = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 256;
      };
    };
  };

  users.users.${username}.extraGroups = [ "audio" ];
}