{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # Archives
    zip
    unzip
    p7zip

    # Utils
    ripgrep
    yq-go
    htop

    # Misc
    libnotify
    wineWowPackages.wayland
    xdg-utils
    graphviz

    # Productivity
    obsidian

    # IDE
    insomnia
    vscode

    # Cloud native
    docker-compose
    kubectl

    # Development
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn

    # DB Related
    dbeaver-bin
    mycli
    pgcli
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      extraConfig = "mouse on";
    };

    bat = {
      enable = true;
      config.pager = "less -FR";
    };

    btop.enable = true;
    eza.enable = true;
    jq.enable = true;
    ssh.enable = true;
    aria2.enable = true;

    skim = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files -hidden";
      changeDirWidgetOptions = [
        "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };
  };

  services = {
    syncthing.enable = true;
    udiskie.enable = true;
  };
}
