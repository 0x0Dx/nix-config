{
  description = "0x0D's NixOS configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    helix.url = "github:helix-editor/helix/master";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-vscode-extensions, ... }: {
    nixosConfigurations = {
      "404NotFound" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
           
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
