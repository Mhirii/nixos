{ config, ... }:
let
  base16 = config.stylix.base16Scheme;
in
{
  programs.fish = {
    enable = true;

    shellInit = # fish
      ''
        set fish_greeting

        set VIRTUAL_ENV_DISABLE_PROMPT 1
        set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
        set -x MANROFFOPT -c

        # set -x SHELL "/usr/bin/env fish"

        set -x QT_QPA_PLATFORM wayland

        set -U __done_min_cmd_duration 10000
        set -U __done_notification_urgency_level low

        set -x XDG_DATA_HOME $HOME/.local/share
        set -x XDG_CONFIG_HOME $HOME/.config
        set -x XDG_STATE_HOME $HOME/.local/state
        set -x XDG_CACHE_HOME $HOME/.cache

        set -x CARGO_HOME $XDG_DATA_HOME/cargo
        set -x CUDA_CACHE_PATH $XDG_CACHE_HOME/nv
        set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
        set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
        set -x GOPATH $XDG_DATA_HOME/go
        set -x GOBIN $GOPATH/bin
        set -gx BUN_INSTALL "$HOME/.bun"

        set WGPU_BACKEND gl

        set -Ux fish_user_paths /usr/local/bin
        if test -d ~/.local/bin
            if not contains -- ~/.local/bin $PATH
                set -p PATH ~/.local/bin
            end
        end

        set -Ua fish_user_paths /home/mhiri/.local/share/cargo/bin
        fish_add_path -U $CARGO_HOME/bin

        set -gx PNPM_HOME "/home/mhiri/.local/share/pnpm"
        if not string match -q -- $PNPM_HOME $PATH
            set -gx PATH "$PNPM_HOME" $PATH
        end

        fish_add_path -U $BUN_INSTALL/bin
        fish_add_path -U $GOPATH
        fish_add_path -U $GOBIN
      '';

    interactiveShellInit = # fish
      ''
          set fish_greeting

          set VIRTUAL_ENV_DISABLE_PROMPT 1
          set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
          set -x MANROFFOPT -c

          set -U __done_min_cmd_duration 10000
          set -U __done_notification_urgency_level low

          if [ "$fish_key_bindings" = fish_vi_key_bindings ]
              bind -Minsert ! __history_previous_command
              bind -Minsert '$' __history_previous_command_arguments
          else
              bind ! __history_previous_command
              bind '$' __history_previous_command_arguments
          end

          zoxide init fish | source

          if status --is-interactive
              source ("starship" init fish --print-full-init | psub)
              # function starship_transient_prompt_func
              #   starship module character
              # end
              # enable_transience
          end

          fish_vi_key_bindings

        # binds
          bind \cz undo

          if [ "$fish_key_bindings" = fish_vi_key_bindings ]

              bind -Minsert \cz undo
              bind \cz undo
              bind -Minsert ! __history_previous_command
              bind -Minsert '$' __history_previous_command_arguments

              bind \ef zoxide_find
              bind \et tmux_fzf
              bind \eg lazygit

              bind right forward-char
              bind left backward-char

              # hjkl
              bind -Minsert \e\ch backward-char
              bind -Minsert \e\cj down-or-search
              bind -Minsert \e\ck up-or-search
              bind -Minsert \e\cl forward-char

              bind -Minsert \cx delete-char
              bind -Minsert \cb backward-word
              bind -Minsert \cw forward-word

              bind -Minsert \ca beginning-of-line
              bind -Minsert \ce end-of-line
              bind -Minsert \cp up-or-search
              bind -Minsert \cn down-or-search

              bind \e\e switch_mode
          else
              bind ! __history_previous_command
              bind '$' __history_previous_command_arguments

              bind \ef zoxide_find
              bind \eg lazygit

              bind right forward-char
              bind left backward-char

              # hjkl
              bind \ch backward-char
              bind \cj down-or-search
              bind \ck up-or-search
              bind \cl forward-char

              bind \cx delete-char
              bind \cb backward-word
              bind \cw forward-word

              bind \ca beginning-of-line
              bind \ce end-of-line
              bind \cp up-or-search
              bind \cn down-or-search

              bind \e\e switch_mode
          end

          sed -i "s/#//" $HOME/.config/fish/themes/stylix.theme
          fish_config theme choose stylix # declared below
      '';

    functions = {
      __history_previous_command = # fish
        ''
          switch (commandline -t)
              case "!"
                  commandline -t $history[1]
                  commandline -f repaint
              case "*"
                  commandline -i !
          end
        '';
      __history_previous_command_arguments = # fish
        ''
          switch (commandline -t)
              case "!"
                  commandline -t ""
                  commandline -f history-token-search-backward
              case "*"
                  commandline -i '$'
          end
        '';
      getVitePID = # fish
        ''
          pgrep -a node | rg internship | sed 's/ .*//' $argv
        '';
      switch_mode = # fish
        ''
          if [ "$fish_key_bindings" = fish_vi_key_bindings ]
              fish_default_key_bindings
              set mode Default
          else
              fish_vi_key_bindings
              set mode Vim
          end

          echo "$mode Keybinds set"
          starship prompt
        '';
      tmux_fzf = # fish
        ''
          set prev (pwd)
          zi
          set name (basename (pwd))
          if test "$name" != mhiri
              if tmux has-session -t $name
                  tmux attach -t $name
              else
                  tmux new -s (basename (pwd))
              end
              cd $prev
          end
          starship prompt
        '';
      yz = # fish
        ''
          set tmp (mktemp -t "yazi-cwd.XXXXX")
          yazi $argv --cwd-file="$tmp"
          if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
              cd -- "$cwd"
          end
          rm -f -- "$tmp"
        '';
      zoxide_find = #fish
        ''
          zi
          starship prompt
        '';
      nixw = # fish
        ''
          if ! test -f ./flake.nix
            echo "No flake.nix found"
            return 1
          end
          if ! test -f ./.git/config
            echo "No git repo found"
            return 1
          end
          git add . && \
          rm -f $HOME/.config/fish/themes/stylix.theme.bckup && \
          sudo nixos-rebuild switch --flake $HOME/flake#desktop
        '';
    };

    shellAbbrs = {
      t = "tmux";
      tks = "tmux kill-session";
      tls = "tmux list-sessions";
      tlc = "tmux list-clients";
      tns = "tmux new -s";

      lzd = "lazydocker";
      lzg = "lazygit";
      lg = "lazygit";

      cr = "cargo r";
      cb = "cargo b";
      ct = "cargo t";

      v = "nvim";
    };

    shellAliases = {
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
    };
  };

  home.file."stylix" = {
    target = ".config/fish/themes/stylix.theme";
    text = "
      preferred_background: ${base16.base00}
      fish_color_normal ${base16.base07}
      fish_color_command ${base16.base0D}
      fish_color_param ${base16.base0C }
      fish_color_keyword ${base16.base0E}
      fish_color_quote ${base16.base0B}
      fish_color_redirection ${base16.base0E}
      fish_color_end ${base16.base09}
      fish_color_comment ${base16.base06}
      fish_color_error ${base16.base08 }
      fish_color_gray ${base16.base06}
      fish_color_selection --background=${base16.base04}
      fish_color_search_match --background=${base16.base04}
      fish_color_option ${base16.base0B}
      fish_color_operator ${base16.base0E}
      fish_color_escape ${base16.base08}
      fish_color_autosuggestion ${base16.base06}
      fish_color_cancel ${base16.base0A }
      fish_color_cwd f6d484
      fish_color_user ${base16.base0B}
      fish_color_host ${base16.base0D}
      fish_color_host_remote ${base16.base0B}
      fish_color_status ${base16.base0A }
      fish_pager_color_progress ${base16.base06}
      fish_pager_color_prefix ${base16.base06}
      fish_pager_color_completion ${base16.base06}
      fish_pager_color_description ${base16.base06}
      ";
  };

}
