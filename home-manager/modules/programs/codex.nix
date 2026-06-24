{
  inputs,
  pkgs,
  ...
}: let
  codexCli = inputs.codex-cli-nix.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  home.packages = [codexCli];

  home.sessionVariables.CODEX_CLI_PATH = "${codexCli}/bin/codex";

  imports = [inputs.codex-desktop-linux.homeManagerModules.default];

  programs.codexDesktopLinux = {
		enable = true;
    # computerUseUi.enable = true;
    # remoteMobileControl.enable = true;
    # remoteControl = {
    #   enable = true;
    #   package = codexCli;
    # };
		cliPackage = codexCli;
  };
}
