{...}: {
  imports = [
    ./btop.nix
    ./git.nix
    ./starship.nix
    ./tmux.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  programs.bat.enable = true;
  programs.fd = {
    enable = true;
    hidden = true;
    ignores = [".git/*" "node_modules/*" "dist/*" "tmp/*"];
  };

  programs.fzf.enable = true;
  programs.fzf.tmux.enableShellIntegration = true;

  programs.jq.enable = true;
  programs.lazygit.enable = true;
  programs.man.enable = true;
  programs.ripgrep.enable = true;
}
