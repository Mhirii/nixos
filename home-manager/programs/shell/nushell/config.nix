{ pkgs, config, ... }:
let
  envconfig = with config.stylix.base16Scheme;  #sh
    ''
      show_banner: false
      ls: {
          use_ls_colors: true
          clickable_links: true
      }
      datetime_format: {
        normal: '%H:%M:%S'
      }
      menus : [
        {
          name : "completion_menu"
          only_buffer_difference : false
          marker : "? "
          type : {
            layout : "columnar" # list, description
            columns : 4
            col_padding : 2
          }
          style : {
            text : "magenta"
            selected_text : "blue_reverse"
            description_text : "yellow"
          }
        }
      ]
      edit_mode: vi
      cursor_shape: {
          vi_insert: block
          vi_normal: underscore
      }
      color_config: {
        separator: "${base03}"  
        leading_trailing_space_bg: "${base04}"
        header: "${base0B}"
        date: "${base0E}"
        filesize: "${base0D}"
        row_index: "${base0C}"
        bool: "${base08}"
        int: "${base0C}"
        duration: "${base08}"
        range: "${base08}"
        float: "${base08}"
        string: "${base04}"
        nothing: "${base08}"
        binary: "${base08}"
        cellpath: "${base08}"
        hints: dark_gray

        shape_garbage: { fg: "${base07}" bg: "${base08}" }
        shape_bool: "${base0D}"
        shape_int: { fg: "${base0E}" attr: b }
        shape_float: { fg: "${base0E}" attr: b }
        shape_range: { fg: "${base0A}" attr: b }
        shape_internalcall: { fg: "${base0C}" attr: b }
        shape_external: "${base0C}"
        shape_externalarg: { fg: "${base0B}" attr: b }
        shape_literal: "${base0D}"
        shape_operator: "${base0A}"
        shape_signature: { fg: "${base0B}" attr: b }
        shape_string: "${base0B}"
        shape_filepath: "${base0D}"
        shape_globpattern: { fg: "${base0D}" attr: b }
        shape_variable: "${base0E}"
        shape_flag: { fg: "${base0D}" attr: b }
        shape_custom: { attr: b }
      }
    '';
  completions =
    let
      completion = name: ''
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${name}/${name}-completions.nu
      '';
    in
    names:
    builtins.foldl'
      (prev: str: "${prev}\n${str}") ""
      (map (name: completion name) names);
in
{
  programs.nushell.extraConfig =
    ''
      $env.config = {${envconfig}};
      ${completions ["cargo" "git" "nix" "npm" "bat" "make" "gh" "less" "man" "pnpm" "rustup"  "tar" "rg" "curl"]}
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/auto-generate/parse-fish.nu
    '';
}
