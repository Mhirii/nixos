{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" ];
    };
    dirHashes = {
      dots = "$HOME/flake";
      docs = "$HOME/Documents";
      down = "$HOME/Downloads";
      work = "$HOME/Work";
      projects = "$HOME/projects";
    };
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
    '';
    shellAliases = {
      tree = "eza --icons --tree --group-directories-first";

      ls = "eza -al --color=always --group-directories-first --icons";
      la = "eza -a --color=always --group-directories-first --icons";
      ll = "eza -l --color=always --group-directories-first --icons";
      lt = "eza -aT --color=always --group-directories-first --icons";
      "l." = "eza -ald --color=always --group-directories-first --icons .*";

      getip = "curl https://ipinfo.io/ip";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";

      untar = "tar -zxvf";

      lg = "lazygit";
      v = "nvim";
      t = "tmux";
      lzd = "lazydocker";

      # Nixos
      cdnix = "cd ~/flake && nvim";
      ns = "nix-shell --run zsh";
    };

    antidote = {
      enable = true;
      plugins = [
        "ohmyzsh/ohmyzsh path:lib/git.zsh"
        "ohmyzsh/ohmyzsh path:lib/clipboard.zsh"
        "ohmyzsh/ohmyzsh path:plugins/aliases"
        "ohmyzsh/ohmyzsh path:plugins/copypath"
        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/extract"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/git-extras"
        "ohmyzsh/ohmyzsh path:plugins/magic-enter"
        "ohmyzsh/ohmyzsh path:plugins/npm"
        "ohmyzsh/ohmyzsh path:plugins/tmux"
        "djui/alias-tips"
        "dim-an/cod"
        "wfxr/forgit"
        "chisui/zsh-nix-shell"
        "nix-community/nix-zsh-completions"
        "mattmc3/zfunctions"
        "zsh-users/zsh-autosuggestions"
        "zdharma-continuum/fast-syntax-highlighting kind:defer"
        "zsh-users/zsh-history-substring-search"
        "Aloxaf/fzf-tab"
      ];
    };

    initExtra = #bash
      ''
        bindkey '^A' beginning-of-line
        bindkey '^E' end-of-line
        bindkey -v
        # unbind alt+c / escape+c
        bindkey -r '^[c'

        nixw(){
          if ! [ -f ./flake.nix ]; then
            echo "No flake.nix found"
            return 1
          fi
          if ! [ -f ./.git/config ]; then
            echo "No git repo found"
            return 1
          fi
          git add . && \
          nix fmt . && \
          git add . && \
          rm -f $HOME/.config/fish/themes/stylix.theme.bckup && \
          sudo nixos-rebuild switch --flake $HOME/flake#desktop
        }
      '';
  };
}
