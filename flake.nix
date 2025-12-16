{
  description = "0x0D's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    helix.url = "github:helix-editor/helix/master";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      "404NotFound" = let
         username = "oxod";
         specialArgs = {inherit username;};
       in
         nixpkgs.lib.nixosSystem {
           inherit specialArgs;
           system = "x86_64-linux";
           
           modules = [
             ./hosts/404NotFound
             ./users/${username}/nixos.nix
             
             home-manager.nixosModules.home-manager {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.backupFileExtension = "backup";
              
               home-manager.extraSpecialArgs = inputs // specialArgs;
               home-manager.users.${username} = import ./users/${username}/home.nix; 
             }
           ];
         };
    };
  };
}
