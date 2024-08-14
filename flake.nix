{
  description = "Hyprland";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    stylix.url = "github:danth/stylix";
  };

  outputs = {self, nixpkgs, ... }@inputs :
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;	
      };
      lib = nixpkgs.lib;

    in
    {
      # packages.x86_64-linux.default = nixpkgs.legacyPackages.${system}.hello;
      nixosConfigurations.mhiri = lib.nixosSystem {
        specialArgs = { inherit system inputs; };
        modules = [
          inputs.stylix.nixosModules.stylix
          ./nixos/configuration.nix
          ./hosts/desktop/hardware-configuration.nix
          ./modules/bundle.nix
          ./home-manager/home.nix
        ];
      };
    };
}
