{ lib, ... }:
{
  imports = [
    ./bash.nix
    ./zsh.nix
    ./fish.nix
    ./nushell
  ];
  home.shellAliases = {

    ls = lib.mkDefault "eza -al --color=always --group-directories-first --icons";
    la = lib.mkDefault "eza -a --color=always --group-directories-first --icons";
    ll = lib.mkDefault "eza -l --color=always --group-directories-first --icons";
    lt = lib.mkDefault "eza -aT --color=always --group-directories-first --icons";
    "l." = lib.mkDefault "eza -ald --color=always --group-directories-first --icons .*";

    ".." = lib.mkDefault "cd ..";
    "..." = lib.mkDefault "cd ../..";
    "...." = lib.mkDefault "cd ../../..";
    "....." = lib.mkDefault "cd ../../../..";
    "......" = lib.mkDefault "cd ../../../../..";

    untar = lib.mkDefault "tar -zxvf";

    lg = lib.mkDefault "lazygit";
    v = lib.mkDefault "nvim";

    grep = "grep --color=auto";
    # network
    myip = "curl http://ipecho.net/plain; echo";
    # ps
    ps = "ps auxf";
    psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e";
  };
  home.sessionVariables = {
    BROWSER = "floorp";
    TERM = "xterm-256color";
    TERMINAL = "kitty";
    EDITOR = "nvim";
    USE_EDITOR = "$EDITOR";
    VISUAL = "$EDITOR";
  };
}
