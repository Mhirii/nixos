{ pkgs, ... }:
{
  programs.bash = {
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
    shellAliases =
      {
        ls = "eza -al --color=always --group-directories-first --icons";
        la = "eza -a --color=always --group-directories-first --icons";
        ll = "eza -l --color=always --group-directories-first --icons";
        lt = "eza -aT --color=always --group-directories-first --icons";
        "l." = "eza -ald --color=always --group-directories-first --icons .*";

        cat = "'bat --style header --style snip --style changes --style header'";
        getip = "curl https://ipinfo.io/ip";

        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";
        "......" = "cd ../../../../..";

        untar = "tar -zxvf";

        lzd = "lazydocker";
        lzg = "lazygit";
        lg = "lazygit";
        v = "nvim";
        t = "tmux";

        tks = "tmux kill-session";
        tls = "tmux list-sessions";
        tlc = "tmux list-clients";
        tns = "tmux new -s";
      };
  };
}
