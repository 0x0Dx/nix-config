{ pkgs, config, inputs, ... }: {
  imports = [
    ./variables.nix

    ../../home/programs/kitty
    ../../home/programs/ghostty
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/discord
    ../../home/programs/tailscale

    ../../home/scripts

    ../../home/system/hyprland
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/vicinae
    ../../home/system/wofi
    ../../home/system/hypridle
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/"+config.var.username;

    packages = with pkgs; [
      # Apps
      vlc # Video player
      blanket # White noise app
      obsidian # Note taking app
      planify # Todolist
      textpieces # Manipulate texts
      curtail # Compress images
      resources # Resource monitor
      gnome-clocks # Clocks app
      gnome-text-editor # Basic graphic text editor
      mpv # Video player
      firefox # Web browser

      # Privacy
      telegram-desktop # Telegram app
      protonvpn-gui
      proton-pass
      proton-authenticator
      ticktick # Privacy friendly todo app

      # Dev
      go
      bun
      docker
      nodejs
      python3
      jq
      just
      pnpm
      wireshark
      nuclei

      # Utils
      zip
      unzip
      optipng
      jpegoptim
      pfetch
      btop
      fastfetch

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix

      # IDE
      vscode
    ];

    #file.".face.icon" = { source = ./profile_picture.png; };

    stateVersion = "25.05;"
  };

  programs.home-manager.enable = true;
}