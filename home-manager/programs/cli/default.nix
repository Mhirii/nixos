{
  imports = [
    ./btop.nix
    ./yazi.nix
    ./starship.nix
    ./git.nix
    ./tmux.nix
    ./zoxide.nix
    ./cava.nix
  ];
  programs.bat.enable = true;
  programs.fd.enable = true;
  programs.fd.hidden = true;
  programs.fd.ignores = [ ".git/*" "node_modules/*" "dist/*" "tmp/*" ];
  programs.fzf.enable = true;
  programs.fzf.tmux.enableShellIntegration = true;
  programs.jq.enable = true;
  programs.lazygit.enable = true;
  programs.man.enable = true;
  programs.navi.enable = true;
  programs.ripgrep.enable = true;
}
