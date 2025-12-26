{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        "$mod,RETURN, exec, uwsm app -- ${pkgs.ghostty}/bin/ghostty"
        "$mod,E, exec,  uwsm app -- ${pkgs.xfce.thunar}/bin/thunar"
        "$mod,B, exec,  uwsm app -- ${pkgs.brave}/bin/firefox"
        "$mod,K, exec,  uwsm app -- ${pkgs.proton-pass}/bin/proton-pass"
        "$mod,M, exec,  uwsm app -- ${pkgs.protonmail-desktop}/bin/proton-mail"
        "$mod,V, exec,  uwsm app -- ${pkgs.protonvpn-gui}/bin/protonvpn-app"
        "$mod,A, exec,  uwsm app -- ${pkgs.proton-authenticator}/bin/proton-authenticator"
        "$mod,L, exec,  uwsm app -- ${pkgs.hyprlock}/bin/hyprlock"
        "$mod,SPACE, exec, vicinae toggle"
        "$mod,X, exec, powermenu"
        "$shiftMod,SPACE, exec, hyprfocus-toggle"
        "$mod,Q, killactive,"
        "$mod,T, togglefloating"
        "$mod,F, fullscreen"
        "$mod,left, movefocus, l"
        "$mod,right, movefocus, r"
        "$mod,up, movefocus, u"
        "$mod,down, movefocus, d"
        "$shiftMod,up, focusmonitor, -1"
        "$shiftMod,down, focusmonitor, 1"
        "$shiftMod,left, layoutmsg, addmaster"
        "$shiftMod,right, layoutmsg, removemaster"
        "$mod,PRINT, exec, screenshot region"
        ",PRINT, exec, screenshot monitor" 
        "$shiftMod,PRINT, exec, screenshot window"
        "ALT,PRINT, exec, screenshot region swappy"
        "$shiftMod,T, exec, hyprpanel-toggle"
        "$shiftMod,F2, exec, night-shift"
        "$shiftMod,F3, exec, night-shift"
      ]
      ++ (builtins.concatLists (builtins.genList (i: let
          ws = i + 1;
        in [
          "$mod,code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
        ])
        9));
    bindm = [
      "$mod,mouse:272, movewindow"
      "$mod,R, resizewindow"
    ];
    bindl = [
      ",XF86AudioMute, exec, sound-toggle"
      ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
      ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
      ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
      ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock"
    ];
    bindle = [
      ",XF86AudioRaiseVolume, exec, sound-up"
      ",XF86AudioLowerVolume, exec, sound-down"
      ",XF86MonBrightnessUp, exec, brightness-up"
      ",XF86MonBrightnessDown, exec, brightness-down"
    ];
  };
}
