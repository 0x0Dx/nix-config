{config, pkgs, nil, ...}: {
  home.packages = with pkgs; [
    nil.packages."${pkgs.system}".default
    insomnia
    conda
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