{ pkgs, ... }: let
  caffeine-status = pkgs.writeShellScriptBin "caffeine-status" ''
    [[ $(pidof "hypridle") ]] && echo "0" || echo "1"
  '';

  caffeine-status-icon = pkgs.writeShellScriptBin "caffeine-status-icon" ''
    [[ $(pidof "hypridle") ]] && echo "󰾪" || echo "󰅶"
  '';

  caffeine = pkgs.writeShellScriptBin "caffeine" ''
    if [[ $(pidof "hypridle") ]]; then
      systemctl --user stop hypridle.service
      ${pkgs.swayosd}/bin/swayosd-client --custom-message="Caffeine On" --custom-icon="emblem-default"
    else
      systemctl --user start hypridle.service
      ${pkgs.swayosd}/bin/swayosd-client --custom-message="Caffeine Off" --custom-icon="emblem-default"
    fi
  '';
in {home.packages = [caffeine-status caffeine caffeine-status-icon];}