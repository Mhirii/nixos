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
    ags.url = "github:Aylur/ags";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs_unstable, home-manager, stylix, hyprland, spicetify-nix, ... } @inputs:
    let
      username = "mhiri";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      unstable_pkgs = import nixpkgs_unstable {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;

    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      nixosConfigurations = {
        programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            (import ./hosts/desktop)
            inputs.spicetify-nix.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mhiri = import ./home-manager/home.nix;
              home-manager.backupFileExtension = "bckup";
              home-manager.extraSpecialArgs = { inherit inputs username; };
            }
            inputs.stylix.nixosModules.stylix
            (import ./modules/stylix.nix)
          ];
          specialArgs = { host = "desktop"; inherit self inputs username stylix spicetify-nix unstable_pkgs; };
        };

      };
    };
}
