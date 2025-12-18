{ config, pkgs, ... }: {
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  services.printing.enable = true;

  fonts = {
    enableDefaultFonts = false;
    fontDir.enable = true;

    fonts = with pkgs; [
      material-design-icons
      font-awesome
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji 
      noto-fonts-extra 
      source-sans 
      source-serif 
      source-han-sans  
      source-han-serif 
      (nerdfonts.override { fonts = [
        "FiraCode"
        "JetBrainsMono"
        "Iosevka"
      ];})
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  programs.dconf.enable = true;

  networking.firewall.enable = false;

  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    neovim 
    wget
    curl
    git 
    git-lfs 
    devenv
    (let base = pkgs.appimageTools.defaultFhsEnvArgs; in 
    pkgs.buildFHSUserEnv (base // {
      name = "fhs";
      targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config]; 
      profile = "export FHS=1"; 
      runScript = "bash"; 
      extraOutputsToInstall = ["dev"];
    }))
  ];

  environment.variables.EDITOR = "nvim";

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;
  sound.enable = false;
  hardware.pulseaudio.enable = false;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.flatpak.enable = true;

  services.power-profiles-daemon = {
    enable = true;
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  services = {
    dbus.packages = [ pkgs.gcr ];

    geoclue2.enable = true;

    udev.packages = with pkgs; [ 
      gnome.gnome-settings-daemon
      platformio 
    ];
  };

  programs.adb.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  services.upower.enable = true;
}