{
  description = "Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    stylix.url = "github:danth/stylix";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {self, nixpkgs, home-manager, stylix, ... }@inputs :
    let
      username = "mhiri";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;	
      };
      lib = nixpkgs.lib;

    in
    {
      nixosConfigurations={
        specialArgs = { host="desktop"; inherit self inputs username ; };
        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mhiri = import ./home-manager/home.nix ;
            }
            (import ./hosts/desktop)
          ];
        };

      };
    };
}
