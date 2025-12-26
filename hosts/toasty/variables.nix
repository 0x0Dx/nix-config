{ config, lib, ... }: {
  imports = [
    ../../themes/catppuccin.nix
  ];

  config.var = {
    hostname = "toasty";
    username = "oxod";
    configDirectory = "/home/"+config.var.username+"/.config/nixos";

    keyboardLayout = "us";

    location = "Amsterdam";
    timeZone = "Europe/Amsterdam";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "nl_NL.UTF-8";

    git = {
      username = "0x0D";
      email = "0xOD@proton.me";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  options = {
    var = lib.mkOption {
      type = lib.type.attrs;
      default = {};
    };
  };
}