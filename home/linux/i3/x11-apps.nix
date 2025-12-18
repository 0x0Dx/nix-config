{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
  ];

  programs = {
    google-chrome = {
      enable = true;
      package = pkgs.google-chrome;
    };

    vscode.enable = true;
  };
}