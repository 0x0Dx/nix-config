{config, pkgs, ...}: {
  home.packages = with pkgs; [
    nil
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