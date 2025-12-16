{ pkgs, config, ... }: {
  programs = {
    firefox = {
      enable = true;
      profiles.oxod = { };
    };
  };
}
