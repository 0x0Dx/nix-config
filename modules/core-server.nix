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

  fonts = {
    enableDefaultFonts = false;
    fontDir.enable = true;

    fonts = with pkgs; [
      material-design-icons
      font-awesome
      source-sans
      source-han-sans
      (nerdfonts.override { fonts = [
        "FiraCode"
        "JetBrainsMono"
        "Iosevka"
      ];})
    ];

    fontconfig.defaultFonts = {
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

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

  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    aria2
    git
    git-lfs
  ];

  environment.variables.EDITOR = "nvim";

  services.power-profiles-daemon = {
    enable = true;
  };
  services.upower.enable = true;
}