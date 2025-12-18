{config, pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    jetbrains.pycharm-community
    jetbrains.idea-community
    skopeo
    docker-compose
    dive
    kubectl
    kubernetes-helm
    terraform
    pulumi
    pulumictl
    k9s
    awscli
    aws-iam-authenticator
    eksctl
    gnumake
    clang-tools
    clang-analyzer
    delve
    go
    go-outline
    go-tools
    go2nix
    gomodifytags
    gopls
    gotests
    impl
    rustup
    (python310.withPackages(ps: with ps; [
      ipython
      pandas
      requests
      pyquery
    ]))
    minicom
    zig
    k6
    mitmproxy 
    protobuf
  ];

  programs = {
    neovim = {
      enable = true;
      extraConfig = ''
        set number relativenumber
      '';
    };

    direnv = {
    enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
  };

  programs.gh = {
    enable = true;
  };
}