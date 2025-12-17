{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    ripgrep
    yq-go
    htop

    ## networking tools
    wireshark
    wireguard-tools 

    # misc
    libnotify
    wineWowPackages.wayland
    xdg-utils

    # productivity
    obsidian
    hugo

    # IDE
    insomnia
    jetbrains.pycharm-community
    # jetbrains.idea-community

    # cloud native
    docker-compose
    kubectl
    kubernetes-helm
    terraform
    pulumi

    # cloud provider
    awscli

    # C
    clang-tools
    clang-analyzer
    lldb
    gnumake
    cmake
    autoconf
    automake
    bison
    cppcheck
    fakeroot
    flex
    gettext
    groff
    libtool
    m4
    patch
    pkgconf
    texinfo
    binutils

    # Golang
    delve
    go
    go-outline
    go-tools
    gomodifytags
    gopls
    gotests
    impl

    # Rust
    rustup

    # desktop
    telegram-desktop
    discord

    # LibreOffice
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.nl_NL
  ];

  programs = {
    tmux = {
      enable = true;
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
      enableBashIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  services = {
    udiskie.enable = true;
  };
}