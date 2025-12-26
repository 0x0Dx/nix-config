{
  description = "0x0D's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix.url = "github:nix-community/stylix";
    vicinae.url = "github:vicinaehq/vicinae";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  }

  outputs = inputs@{ nixpkgs, ... }: {
    toasty = nixpkgs.lib.nixosSystem { 
      modules = [
        {
          nixpkgs.overlays = [];
          _module.args = {
            inherit inputs;
          };
        } 
        inputs.nixos-hardware.nixosModules.notyet
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        ./hosts/toasty/configuration.nix;
      ];
    };
  }
}