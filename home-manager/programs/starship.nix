{ config, pkgs, ... }:
let
  lang = icon: color: {
    symbol = icon;
    format = "[$symbol ](${color})[$version](${color})";
  };
  os = icon: fg: "[${icon} ](fg:${fg})";
in
{
  programs.starship = {
    enable = true;
    settings = {
      right_format = "$cmd_duration";
      format = builtins.concatStringsSep "" [
        "$nix_shell"
        "$os"
        "$directory"
        "$container"
        "$git_branch"
        "$nodejs"
        "$python"
        "$lua"
        "$rust"
        "$java"
        "$c"
        "$golang"
        "$status"
        "$line_break"
        "\n"
        "$character"
      ];
      add_newline = true;
      line_break.disabled = true;
      scan_timeout = 10;
      character = {
        success_symbol = "[](blue bold)";
        error_symbol = "[](red)";
        vicmd_symbol = "[](green)";
        vimcmd_replace_one_symbol = "[](red)";
        vimcmd_replace_symbol = "[](red)";
        vimcmd_visual_symbol = "[](purple)";
      };
      git_branch = {
        symbol = "";
        style = "";
        format = "[ $symbol $branch](fg:purple)(:$remote_branch) ";
      };
      git_status = {
        ahead = ">";
        behind = "<";
        diverged = "<>";
        renamed = "r";
        deleted = "x";
      };
      nix_shell = {
        disabled = false;
        format = "[ ](bg:white fg:black) ";
      };
      container = {
        symbol = " 󰏖";
        format = "[$symbol ](yellow dimmed)";
      };
      directory = {
        format = builtins.concatStringsSep "" [
          " [$path](fg:cyan)"
          " [$read_only](fg:yellow)"
        ];
        read_only = " ";
        truncate_to_repo = true;
        truncation_length = 4;
        truncation_symbol = "";
      };

      python = lang "" "yellow";
      nodejs = lang "󰎙" "green";
      bun = lang "󰛦" "blue";
      deno = lang "󰛦" "blue";
      lua = lang "󰢱" "blue";
      rust = lang "" "red";
      java = lang "" "red";
      c = lang "" "blue";
      golang = lang "" "blue";
      dart = lang "" "blue";
      elixir = lang "" "purple";

      os = {
        disabled = false;
        format = "$symbol";
        symbols = {
          Arch = os "" "bright-blue";
          Alpine = os "" "bright-blue";
          Debian = os "" "red";
          EndeavourOS = os "" "purple";
          Fedora = os "" "blue";
          NixOS = os "" "blue";
          openSUSE = os "" "green";
          SUSE = os "" "green";
          Ubuntu = os "" "bright-purple";
          Macos = os "" "white";
        };
      };

      cmd_duration = {
        min_time = 1;
        format = "[ ](fg:yellow bold)$duration(fg:white)";
      };
    };
  };

  programs.nushell = {
    extraEnv = ''
      mkdir ${config.xdg.cacheHome}/starship
      ${pkgs.starship}/bin/starship init nu | save -f ${config.xdg.cacheHome}/starship/init.nu
    '';
    extraConfig = ''
      use ${config.xdg.cacheHome}/starship/init.nu
    '';
  };
}
