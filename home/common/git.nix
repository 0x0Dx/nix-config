{ config, lib, pkgs, ... }: {
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "0x0D";
    userEmail = "0xOD@proton.me";

    includes = [
      {
        path = "~/work/.gitconfig";
        condition = "gitdir:~/work/";
      }
    ];

    extraConfig = {
      pull = {
        rebase = true;
      };

      url = {
        "ssh://git@github.com/" = {
          insteadOf = "https://github.com/";
        };
        "ssh://git@gitlab.com/" = {
          insteadOf = "https://gitlab.com/";
        };
        "ssh://git@bitbucket.com/" = {
          insteadOf = "https://bitbucket.com/";
        };
      };
    };

    delta = {
      enable = true;
      options = {
        features = "side-by-side";
      };
    };
  };
}