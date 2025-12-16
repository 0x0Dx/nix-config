{ config, pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      # rime-data = ./rime-data-flypy;
      # fcitx5-rime = super.fcitx5-rime.override { rimeDataPkgs = [ ./rime-data-flypy ]; };
    })
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-rime
        qt6Packages.fcitx5-configtool
        fcitx5-gtk
      ];
  };
}