deploy:
	sudo nixos-rebuild switch --flake .

debug:
	sudo nixos-rebuild switch --flake . --show-trace --verbose

update:
	nix flake update

history:
	sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

gc:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
	sudo nix store gc --debug
