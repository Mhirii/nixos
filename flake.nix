{
  description = "Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs_unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    stylix.url = "github:danth/stylix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    ags.url = "github:Aylur/ags";


    zen-browser.url = "github:MarceColl/zen-browser-flake";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs_unstable, hyprland, stylix, ... } @inputs:
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
      prefs = { nvidiaOffload = false; gnome = false; gdm = true; };
      backupName = builtins.readFile (builtins.toFile "date" ''
        date +backup-%d-%m_%H-%M
      '');
      commonModules = profile:
        [ (import ./hosts/${profile}) ]
      ;

      mkSystem = host: profile: lib.nixosSystem {
        inherit system;
        modules = commonModules profile;
        specialArgs = { inherit self inputs username unstable_pkgs system profile stylix prefs; host = "nixos-${host}"; };

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
