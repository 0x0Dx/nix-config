{ pkgs, ... }: {
  environment.pathsToLink = ["/libexec"];
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "hyprland";
      lightdm.enable = false;
      gdm = {
        enable = true;
	wayland = true;
      };
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.light.enable = true;

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    swaybg
    swayidle
    swaylock
    wlogout
    wl-clipboard
    wf-recorder
    grim
    slurp
    wofi
    mako
    yad
    mpd
    mpc
    ncmpcpp
    networkmanagerapplet
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  services.upower.enable = true;
}
