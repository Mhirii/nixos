{
  config,
  lib,
  ...
}: {
  options.programs.opencode.tui = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = {};
    description = ''
      Compatibility option for modules that still write OpenCode TUI settings
      to the former programs.opencode.tui option.
    '';
  };

  config.programs.opencode.settings = lib.mkIf (config.programs.opencode.tui != {}) (
    lib.mkBefore config.programs.opencode.tui
  );
}
