{ config, ... }: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./nushell
    ./common.nix
    ./starship.nix
    ./terminals.nix
  ];

  home.sessionVariables = {
    LESSHISTFILE = cache+"/less/history";
    LESSKEY = c+"/less/lesskey";
    WINEPREFIX = d+"/wine";

    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "alacritty";

    DELTA_PAGER = "less -R";

    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };
}
