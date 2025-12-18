{ pkgs, pkgs-stable, ... }: {
  programs = {
    google-chrome = {
      enable = true;
      package = pkgs-stable.google-chrome;

      commandLineArgs = [
        "--gtk-version=4"
      ];
    };

    firefox = {
      enable = true;
      enableGnomeExtensions = false;
      package = pkgs-stable.firefox;
    };

    vscode.enable = true;
  };
}