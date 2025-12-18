{ pkgs, ... }: {
  imports = [
    ./creative.nix
    ./media.nix
  ];

  home.packages = with pkgs; [
    wireshark
    foliate
    telegram-desktop
    discord
    remmina
    freerdp
    flameshot
  ];
}