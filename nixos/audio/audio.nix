{ pkgs, ... }: {
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [
    helvum
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;

    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = { main."monitor.libcamera" = "disabled"; };
        };
      };
    };
  };
}