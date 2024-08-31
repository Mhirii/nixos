{ unstable_pkgs, pkgs, lib, ... }: {
  stylix.targets.nushell.enable = false;
  programs.nushell = {
    enable = true;
    package = unstable_pkgs.nushell;

    shellAliases = {
      ".." = lib.mkDefault "cd ..";
      "..." = lib.mkDefault "cd ../..";
      "...." = lib.mkDefault "cd ../../..";
      "....." = lib.mkDefault "cd ../../../..";
      "......" = lib.mkDefault "cd ../../../../..";

      untar = lib.mkDefault "tar -zxvf";

      lg = lib.mkDefault "lazygit";
      v = lib.mkDefault "nvim";

      myip = "curl http://ipecho.net/plain; echo";
    };

  };

  imports = [
    ./config.nix
  ];
}
