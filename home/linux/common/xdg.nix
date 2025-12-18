{config, pkgs, ...}: {
  home.packages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = 
        let
          browser = ["firefox.desktop"];
        in
        {
          "application/json" = browser;
          "application/pdf" = browser;

          "text/html" = browser;
          "text/xml" = browser;
          "application/xml" = browser;
          "application/xhtml+xml" = browser;
          "application/xhtml_xml" = browser;
          "application/rdf+xml" = browser;
          "application/rss+xml" = browser;
          "application/x-extension-htm" = browser;
          "application/x-extension-html" = browser;
          "application/x-extension-shtml" = browser;
          "application/x-extension-xht" = browser;
          "application/x-extension-xhtml" = browser;

          "x-scheme-handler/about" = browser;
          "x-scheme-handler/ftp" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "x-scheme-handler/unknown" = browser;
          
          "x-scheme-handler/discord" = ["discord.desktop"];
          "x-scheme-handler/tg" = ["telegramdesktop.desktop"];

          "audio/*" = ["mpv.desktop"];
          "video/*" = ["mpv.dekstop"];
          "image/*" = ["imv.desktop"];
        };

      associations.removed =
        let
          browser = ["google-chrome.desktop"];
        in
        {
          "text/html" = browser;
          "text/xml" = browser;
          "application/xml" = browser;
          "application/xhtml+xml" = browser;
          "application/xhtml_xml" = browser;
          "application/rdf+xml" = browser;
          "application/rss+xml" = browser;
          "image/gif" = browser;
          "image/jpeg" = browser;
          "image/png" = browser;
          "image/webp" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "application/pdf" = browser;
        };
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}