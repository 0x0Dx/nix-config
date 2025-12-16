{ pkgs, ... }: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "0x0D";
    userEmail = "0xOD@proton.me";
  };
}