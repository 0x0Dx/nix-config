{config, pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    nnn
    zip
    xz
    unzip
    p7zip
    ripgrep
    jq
    yq-go
    exa
    fzf
    mtr
    iperf3
    ldns
    aria2
    socat
    nmap
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    caddy
    gnupg
    nix-output-monitor
    hugo
    glow
  ];

  programs = {
    tmux = {
      enable = true;
    };

    bat = {
      enable = true;
      config.pager = "less -FR";
    };

    skim = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

  home.shellAliases = {
    k = "kubectl";
    vim = "nvim";

    urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  };
}