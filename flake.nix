{
  description = "Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs_unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { self, nixpkgs, home-manager, stylix, hyprland, ... }@inputs:
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
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      nixosConfigurations = {
        specialArgs = { host = "desktop"; inherit self inputs username stylix; };
        programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            (import ./hosts/desktop)
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mhiri = import ./home-manager/home.nix;
              home-manager.backupFileExtension = "bckup";
            }
            inputs.stylix.nixosModules.stylix
            (import ./modules/stylix.nix)
          ];
        };

      };
    };
}
