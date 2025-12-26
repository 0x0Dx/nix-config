{ pkgs, config, ... }: let
  configDirectory = config.var.configDirectory;

  toasty = pkgs.writeShellScriptBin "toasty"
    ''
      function exec() {
        $@
      }

      function ui(){
        DEFAULT_ICON="󰘳"

        # "icon;name;command"[]
        apps=(
          "󰑓;Rebuild;toasty rebuild"
          "󰐊;Test;toasty test"
          "󰚰;Update;toasty update"
          ";Collect Garbage;toasty gc"
          "󰍜;Clean Boot Menu;toasty cb"
          ";List generation;toasty listgen"
          "󰌌;Hyprland Keybindings;nvim ${configDirectory}/docs/KEYBINDINGS-HYPRLAND.md"
          "󰋩;Wallpapers;zen https://github.com/0x0Dx/wallpapers"
        )

        for i in "''${!apps[@]}"; do
          apps[i]=$(echo "''${apps[i]}" | sed 's/^;/'$DEFAULT_ICON';/')
        done

        fzf_result=$(printf "%s\n" "''${apps[@]}" | awk -F ';' '{print $1" "$2}' | fzf)
        [[ -z $fzf_result ]] && exit 0
        fzf_result=''${fzf_result/ /;}
        line=$(printf "%s\n" "''${apps[@]}" | grep "$fzf_result")
        command=$(echo "$line" | sed 's/^[^;]*;//;s/^[^;]*;//')

        exec "$command"
        exit $?
      }

      [[ $1 == "" ]] && ui

      if [[ $1 == "rebuild" ]];then
        cd ${configDirectory} && git add . && sudo nixos-rebuild switch --flake
      elif [[ $1 == "test" ]];then
        cd ${configDirectory} && git add . && sudo nixos-rebuild test --flake
      elif [[ $1 == "update" ]];then
        cd ${configDirectory} && nix flake update
      elif [[ $1 == "gc" ]];then
        echo "Starting Nix garbage collection..."
        cd ${configDirectory} && \
        echo "Cleaning up system garbage..." && \
        sudo nix-collect-garbage -d && \
        echo "Cleaning up user garbage..." && \
        nix-collect-garbage -d && \
        echo "Collecting garbage from Nix store..." && \
        nix-store --gc && \
        echo "Optimizing Nix store..." && \
        nix-store --optimise
        echo "Nix garbage collection complete."
      elif [[ $1 == "cb" ]];then
        sudo /run/current-system/bin/switch-to-configuration boot
      elif [[ $1 == "listgen" ]];then
        sudo nix-env -p /nix/var/nix/profiles/system --list-generations
      else
        echo "Unknown argument"
      fi
    '';
in { home.packages = [ toasty ]; }
