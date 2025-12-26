{ pkgs, ... }: let
  value = "4500";

  night-shift-on =
    pkgs.writeShellScriptBin "night-shift-on"
    ''
      ${pkgs.hyprsunset}/bin/hyprsunset -t ${value} &
      ${pkgs.swayosd}/bin/swayosd-client --custom-message="Night-Shift On" --custom-icon="emblem-default"
    '';

  night-shift-off =
    pkgs.writeShellScriptBin "night-shift-off"
    ''
      pkill hyprsunset
      ${pkgs.swayosd}/bin/swayosd-client --custom-message="Night-Shift Off" --custom-icon="emblem-default"
    '';

  night-shift =
    pkgs.writeShellScriptBin "night-shift"
    ''
      if pidof "hyprsunset"; then
        night-shift-off
      else
        night-shift-on
      fi
    '';

  night-shift-status =
    pkgs.writeShellScriptBin "night-shift-status"
    ''
      if pidof "hyprsunset"; then
        echo "1"
      else
        echo "0"
      fi
    '';

  night-shift-status-icon =
    pkgs.writeShellScriptBin "night-shift-status-icon"
    ''
      if pidof "hyprsunset"; then
          echo "󰖔"
        else
          echo "󰖕"
        fi
    '';
in {
  home.packages = [
    pkgs.hyprsunset
    night-shift-on
    night-shift-off
    night-shift
    night-shift-status
    night-shift-status-icon
  ];
}