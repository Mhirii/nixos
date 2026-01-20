{
  description = "Home Manager configuration of mhiri";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs_unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nixpkgs_unstable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    unstable_pkgs = import nixpkgs_unstable {
      inherit system;
      config.allowUnfree = true;
    };
    backupName = builtins.readFile (builtins.toFile "date" ''
      date +backup-%d-%m_%H-%M
    '');
  in {
    homeConfigurations."mhiri" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        stylix.homeManagerModules.stylix
        (import ./modules/stylix.nix)
      ];
      extraSpecialArgs = {inherit inputs unstable_pkgs;};
    };
  };
}
