{
  description = "Hyprland";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let 
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.mhiri = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./hosts/desktop/hardware-configuration.nix
          ./modules/bundle.nix
          ./home-manager/home.nix
        ];
      };
    };
}
