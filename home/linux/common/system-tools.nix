{pkgs, config, ...}: {
  home.packages = with pkgs; [
    btop
    htop
    iotop
    nmon
    wireguard-tools
    iftop
    libnotify
    strace
    ltrace
    lsof
    ethtool
    sysstat
    lm_sensors
    cifs-utils
  ];

  services = {
    udiskie.enable = true;
  };
}