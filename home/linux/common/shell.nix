{config, ...}: 
let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in rec {
  systemd.user.sessionVariables = {
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";

    BROWSER = "firefox";
    TERMINAL = "alacritty";
    TERM = "xterm-256color";

    DELTA_PAGER = "less -R";

    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  home.sessionVariables = systemd.user.sessionVariables;
}