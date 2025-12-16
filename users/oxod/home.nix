{ pkgs, ... }: {
  imports = [
    ../../home/core.nix

    ../../home/fcitx5
    ../../home/i3
    ../../home/programs
    ../../home/rofi
    ../../home/shell
  ];

  programs.git = {
    userName = "0x0D";
    userEmail = "0xOD@proton.me";
  };
}
