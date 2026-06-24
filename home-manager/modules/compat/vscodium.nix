{lib, ...}: {
  options.programs.vscodium = {
    enable = lib.mkEnableOption "VSCodium compatibility placeholder";

    profiles = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          extensions = lib.mkOption {
            type = lib.types.listOf lib.types.anything;
            default = [];
          };
          userSettings = lib.mkOption {
            type = lib.types.attrsOf lib.types.anything;
            default = {};
          };
        };
      });
      default = {};
      description = ''
        Compatibility placeholder for Stylix's VSCodium target when Home
        Manager does not provide a programs.vscodium module.
      '';
    };
  };
}
