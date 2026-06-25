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
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    stylix.url = "github:danth/stylix/release-25.11";
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    codex-cli-nix = {
      url = "github:sadjow/codex-cli-nix/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    codex-desktop-linux = {
      url = "github:ilysenko/codex-desktop-linux";
    };
    herdr = {
      url = "github:ogulcancelik/herdr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nixpkgs_unstable,
    noctalia,
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
		nix.settings = {
			substituters = [ "https://codex-cli.cachix.org" ];
			trusted-public-keys = [
				"codex-cli.cachix.org-1:1Br3H1hHoRYG22n//cGKJOk3cQXgYobUel6O8DgSing="
			];
		};
		nixConfig = {
			extra-substituters = [ "https://noctalia.cachix.org" "https://codex-cli.cachix.org" ];
			extra-trusted-public-keys = [
				"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
				"codex-cli.cachix.org-1:1Br3H1hHoRYG22n//cGKJOk3cQXgYobUel6O8DgSing="
			];
		};

    homeConfigurations."mhiri" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        stylix.homeModules.stylix
        (import ./modules/stylix.nix)
      ];
      extraSpecialArgs = {inherit inputs unstable_pkgs;};
    };
  };
}
