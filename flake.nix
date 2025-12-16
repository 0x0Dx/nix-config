{
  description = "0x0D's NixOS configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, home-manager, nix-gaming, ... }: {
    nixosConfigurations = {
      "404NotFound" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
          
        specialArgs = {
          inherit nixpkgs-stable nix-gaming;
        };
        modules = [
          ./hosts/404NotFound
             
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
              
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.oxod = import ./home; 
          }
        ];
      };
    };
  };
}
