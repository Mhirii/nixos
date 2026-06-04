{inputs, pkgs, ...}: 
let 
  codexCli = inputs.codex-cli-nix.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  imports = [
    inputs.codex-cli-nix.homeModules.default
  ];
  programs.codex = {
    enable = true;
  };

	home.sessionVariables.CODEX_CLI_PATH = "${codexCli}/bin/codex";

	programs.codexDesktopLinux = {
		enable=true;
    computerUseUi.enable = true;
    remoteMobileControl.enable = true;
		remoteControl = {
			enable=true;
			package= codexCli;
		};
	};
}
