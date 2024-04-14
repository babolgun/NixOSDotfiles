{
  description = "My NixOS System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # impermanence.url = "github:nix-community/impermanence";    # I will skip impermanence for now
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: 
  let 
    system = "x86_64-linux";
    host = "dkt";
    inherit (import ./hosts/${host}/options.nix) username hostname;
    
    pkgs = import nixpkgs {
      inherit system;
      config = { 
        allowUnfree = true; 
      };
    };
  in {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system; 
          inherit inputs;
          inherit username;
          inherit hostname;
          inherit host;
        };
        modules = [
          ./system.nix
          # impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit inputs;
              inherit host;
              inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPkgs = true;
            home-manager.backupFileExtension = "bkp";
            home-manager.users.${username} = import .users/default/home.nix;
	        }
	      ];
      };
    };
  };
}
