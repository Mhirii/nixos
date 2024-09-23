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

    zen-browser.url = "github:MarceColl/zen-browser-flake";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
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
      prefs = { nvidiaOffload = false; gnome = false; };
      backupName = builtins.readFile (builtins.toFile "date" ''
        date +backup-%d-%m_%H-%M
      '');
      commonModules = profile: [
        (import ./hosts/${profile})
        inputs.spicetify-nix.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.mhiri = import ./home;
          home-manager.backupFileExtension = backupName;
          home-manager.extraSpecialArgs = { inherit inputs username unstable_pkgs profile; };
        }
        inputs.stylix.nixosModules.stylix
        (import ./modules/stylix.nix)
      ];

      mkSystem = host: profile: lib.nixosSystem {
        inherit system;
        modules = commonModules profile;
        specialArgs = { inherit self inputs username stylix spicetify-nix unstable_pkgs system profile prefs; host = "nixos-${host}"; };

      };

    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      nixosConfigurations = {
        desktop = mkSystem "desktop" "desktop";
        laptop = mkSystem "laptop" "laptop";
      };
    };
}
