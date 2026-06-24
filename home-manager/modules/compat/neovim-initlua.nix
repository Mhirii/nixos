{
  config,
  lib,
  ...
}: {
  options.programs.neovim.initLua = lib.mkOption {
    type = lib.types.lines;
    default = "";
    description = ''
      Compatibility option for modules that still write Lua snippets to the
      former programs.neovim.initLua option.
    '';
  };

  config.programs.neovim.extraLuaConfig = lib.mkIf (config.programs.neovim.initLua != "") (
    lib.mkBefore config.programs.neovim.initLua
  );
}
