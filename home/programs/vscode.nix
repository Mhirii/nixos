{ unstable_pkgs, pkgs, config, ... }:
{
  stylix.targets.vscode.enable = false;
  programs.vscode = {
    enable = true;
    package = unstable_pkgs.vscode;
    enableUpdateCheck = false;
    mutableExtensionsDir = true;

    extensions = with unstable_pkgs.vscode-extensions; [
      # Productivity
      asvetliakov.vscode-neovim
      alefragnani.bookmarks
      alefragnani.project-manager
      gruntfuggly.todo-tree
      stephlin.vscode-tmux-keybinding
      vspacecode.whichkey

      # lsp
      streetsidesoftware.code-spell-checker
      vue.volar
      golang.go
      bbenoist.nix
      jeff-hykin.better-nix-syntax
      jnoortheen.nix-ide
      brettm12345.nixfmt-vscode


      # lint/format
      biomejs.biome
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      foxundermoon.shell-format
      mads-hartmann.bash-ide-vscode
      tamasfe.even-better-toml

      # typescript
      yoavbls.pretty-ts-errors
      bradlc.vscode-tailwindcss
      firsttris.vscode-jest-runner
      prisma.prisma
      usernamehw.errorlens
      wix.vscode-import-cost

      #themes
      enkia.tokyo-night
      equinusocio.vsc-material-theme-icons
      catppuccin.catppuccin-vsc

      #editor
      christian-kohler.path-intellisense
      codezombiech.gitignore
      github.copilot
      github.copilot-chat
      adpyke.codesnap
      eamodio.gitlens
      hbenl.vscode-test-explorer
      meganrogge.template-string-converter
      mikestead.dotenv
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode.test-adapter-converter
      naumovs.color-highlight
      visualstudioexptteam.vscodeintellicode
      quicktype.quicktype
      fabiospampinato.vscode-open-in-github
    ];

    keybindings = [
      { "key" = "ctrl+o ctrl+g"; "command" = "projectManager.listGitProjects#sideBarGit"; }
      { "key" = "ctrl+o ctrl+d"; "command" = "projectManager.listAnyProjects#sideBarAny"; }
      { "key" = "ctrl+o ctrl+f"; "command" = "projectManager.listFavoriteProjects#sideBarFavorites"; }
      { "key" = "ctrl+="; "command" = "expand_region"; "when" = "editorTextFocus"; }
      { "key" = "ctrl+-"; "command" = "undo_expand_region"; "when" = "editorTextFocus && editorHasSelection"; }
      { "key" = "Alt+e"; "command" = "workbench.files.action.focusfilesexplorer"; "when" = "editortextfocus"; }
      { "key" = "Alt+e"; "command" = "workbench.action.toggleSidebarVisibility"; }
      { "key" = "Alt+c"; "command" = "workbench.panel.chat.view.copilot.focus"; }
      { "key" = "ctrl+Alt+e"; "command" = "workbench.action.toggleAuxiliaryBar"; }
      { "key" = "ctrl+alt+s"; "command" = "outline-map-view.focus"; }
      { "key" = "ctrl+Alt+e"; "command" = "workbench.action.focusAuxiliaryBar"; "when" = "editortextfocus"; }
      { "key" = "a"; "command" = "explorer.newFile"; "when" = "filesExplorerFocus && !inputFocus"; }
      { "key" = "r"; "command" = "renameFile"; "when" = "filesExplorerFocus && !inputFocus"; }
      { "key" = "c"; "command" = "filesExplorer.copy"; "when" = "filesExplorerFocus && !inputFocus"; }
      { "key" = "p"; "command" = "filesExplorer.paste"; "when" = "filesExplorerFocus && !inputFocus"; }
      { "key" = "d"; "command" = "deleteFile"; "when" = "filesExplorerFocus && !inputFocus"; }
      { "key" = "shift+space"; "command" = "whichkey.show"; }
      { "key" = "ctrl+l"; "command" = "workbench.action.focusNextGroup"; "when" = "filesExplorerFocus && !inputFocus"; }
      { "command" = "vscode-neovim.send"; "key" = "ctrl+g"; "when" = "editorTextFocus && neovim.mode != insert"; "args" = "<C-g>"; }
      { "key" = "ctrl+n"; "command" = "-workbench.action.files.newUntitledFile"; }
      { "key" = "ctrl+n"; "command" = "-vscode-neovim.send-cmdline"; "when" = "neovim.init && neovim.mode == 'cmdline'"; }
      { "key" = "ctrl+shift+w"; "command" = "-workbench.action.closeWindow"; }
      { "key" = "alt+f4"; "command" = "-workbench.action.closeWindow"; }
      { "key" = "ctrl+shift+q"; "command" = "workbench.action.closeActiveEditor"; }
      { "key" = "alt+i"; "command" = "workbench.action.terminal.toggleTerminal"; }
      { "key" = "alt+g"; "command" = "binocular.customCommands"; "args" = "Lazygit"; }

      { "key" = "alt+space c"; "command" = "workbench.action.terminal.newInActiveWorkspace"; "args" = "terminalFocus"; }
      { "key" = "alt+space shift+5"; "command" = "workbench.action.terminal.split"; "args" = "terminalFocus && panelPosition == 'bottom'"; }
      { "key" = "alt+space shift+'"; "command" = "workbench.action.terminal.split"; "args" = "terminalFocus && panelPosition != 'bottom'"; }
      { "key" = "alt+space x"; "command" = "workbench.action.terminal.kill"; "args" = "terminalFocus"; }
      { "key" = "alt+space alt+k"; "command" = "workbench.action.terminal.resizePaneUp"; "args" = "terminalFocus"; }
      { "key" = "alt+space alt+j"; "command" = "workbench.action.terminal.resizePaneDown"; "args" = "terminalFocus"; }
      { "key" = "alt+space alt+h"; "command" = "workbench.action.terminal.resizePaneLeft"; "args" = "terminalFocus"; }
      { "key" = "alt+space alt+l"; "command" = "workbench.action.terminal.resizePaneRight"; "args" = "terminalFocus"; }
      { "key" = "alt+space alt+space"; "command" = "workbench.action.toggleSidebarVisibility"; "args" = "terminalFocus"; }
      { "key" = "alt+space d"; "command" = "workbench.action.terminal.toggleTerminal"; "args" = "terminalFocus"; }
      { "key" = "alt+space w"; "command" = "workbench.action.quickOpenTerm"; "args" = "terminalFocus"; }
      { "key" = "alt+space z"; "command" = "workbench.action.toggleMaximizedPanel"; "args" = "terminalFocus"; }
      { "key" = "shift+right"; "command" = "workbench.action.terminal.focusNext"; "args" = "terminalFocus"; }
      { "key" = "shift+left"; "command" = "workbench.action.terminal.focusPrevious"; "args" = "terminalFocus"; }
      { "key" = "alt+space l"; "command" = "workbench.action.terminal.focusNextPane"; "args" = "terminalFocus && panelPosition == 'bottom'"; }
      { "key" = "alt+space h"; "command" = "workbench.action.terminal.focusPreviousPane"; "args" = "terminalFocus && panelPosition == 'bottom'"; }
      { "key" = "alt+space j"; "command" = "workbench.action.terminal.focusNextPane"; "args" = "terminalFocus && panelPosition != 'bottom'"; }
      { "key" = "alt+space k"; "command" = "workbench.action.terminal.focusPreviousPane"; "args" = "terminalFocus && panelPosition != 'bottom'"; }
      { "key" = "alt+space 1"; "command" = "workbench.action.terminal.focusAtIndex1"; "args" = "terminalFocus"; }
      { "key" = "alt+space 2"; "command" = "workbench.action.terminal.focusAtIndex2"; "args" = "terminalFocus"; }
      { "key" = "alt+space 3"; "command" = "workbench.action.terminal.focusAtIndex3"; "args" = "terminalFocus"; }
      { "key" = "alt+space 4"; "command" = "workbench.action.terminal.focusAtIndex4"; "args" = "terminalFocus"; }
      { "key" = "alt+space 5"; "command" = "workbench.action.terminal.focusAtIndex5"; "args" = "terminalFocus"; }
      { "key" = "alt+space 6"; "command" = "workbench.action.terminal.focusAtIndex6"; "args" = "terminalFocus"; }
      { "key" = "alt+space 7"; "command" = "workbench.action.terminal.focusAtIndex7"; "args" = "terminalFocus"; }
      { "key" = "alt+space 8"; "command" = "workbench.action.terminal.focusAtIndex8"; "args" = "terminalFocus"; }
      { "key" = "alt+space 9"; "command" = "workbench.action.terminal.focusAtIndex9"; "args" = "terminalFocus"; }
    ];

    userSettings = {
      breadcrumbs.enabled = "false";
      diffEditor.wordWrap = "off";
      editor = {
        cursorBlinking = "solid";
        cursorWidth = 1;
        formatOnSave = true;
        guides.bracketPairs = false;
        guides.indentation = false;
        inlayHints.enabled = "offUnlessPressed";
        lineNumbers = "relative";
        linkedEditing = true;
        minimap.renderCharacters = false;
        suggest.insertMode = "replace";
        tabSize = 2;
        fontFamily = "'Monaspace Neon'; monospace ;JetbrainsMono Nerd , Hack, 'FiraCode Nerd Font', 'monospace', monospace";
        codeActionsOnSave = {
          source.fixAll = "never";
          source.addMissingImports = "explicit";
          source.organizeImports.biome = "explicit";
          quickfix.biome = "explicit";
        };
        fontLigatures = "'ss01'; 'ss02'; 'ss03'; 'ss04'; 'ss05'; 'ss06'; 'ss07'; 'ss08'; 'calt'; 'dlig'";
        fontWeight = "500";
        wordWrap = "on";
        lineHeight = 24;
        fontSize = 16;
        smoothScrolling = true;
        scrollbar.vertical = "visible";
        minimap.enabled = false;
        stickyScroll.enabled = false;
        foldingImportsByDefault = true;
      };

      explorer.compactFolders = false;
      security.workspace.trust.untrustedFiles = "open";
      window = {
        commandCenter = false;
        enableMenuBarMnemonics = false;
        menuBarVisibility = "hidden";
        titleBarStyle = "native";
      };
      workbench.layoutControl.enabled = false;
      workbench.sideBar.location = "right";
      workbench.startupEditor = "none";

      # "workbench.colorTheme" = "IDX Monospace Dark";
      workbench.colorTheme = "Catppuccin Mocha";
      "catppuccin.accentColor" = "mauve";
      "catppuccin.boldKeywords" = true;
      "catppuccin.italicComments" = false;
      "catppuccin.italicKeywords" = true;
      "catppuccin.extraBordersEnabled" = false;
      "catppuccin.workbenchMode" = "minimal";
      "catppuccin.bracketMode" = "dimmed";
      "catppuccin.colorOverrides" = {
        mocha =
          let
            base16 = config.stylix.base16Scheme;
          in
          {
            base = "${base16.base00}";
            mantle = "${base16.base00}";
            crust = "${base16.base00}";

            surface0 = "${base16.base01}";
            surface1 = "${base16.base01}";
            surface2 = "${base16.base02}";
            overlay0 = "${base16.base02}";
            overlay1 = "${base16.base03}";
            overlay2 = "${base16.base04}";

            subtext2 = "${base16.base05}";
            subtext1 = "${base16.base06}";
            text = "${base16.base07}";

            red = "${base16.base08}";
            yellow = "${base16.base09}";
            peach = "${base16.base0A}";
            green = "${base16.base0B}";
            teal = "${base16.base0B}";
            sky = "${base16.base0C}";
            blue = "${base16.base0D}";
            sapphire = "${base16.base0D}";
            mauve = "${base16.base0E}";
            flamingo = "${base16.base0F}";
          };
      };
      workbench.colorCustomizations.editor.background = "${config.stylix.base16Scheme.base00}";
      a-file-icon-vscode = {
        arrowTheme = "material";
        filesAssociations = {
          "*.ts" = "typescript";
          "**.json" = "json";
        };
        folderColor = "#7aa2f7";
        folderTheme = "specific";
        opacity = 1;
        saturation = 1;
      };

      outline.showArrays = false;
      outline.showBooleans = false;
      outline.showFields = false;
      outline.showKeys = false;
      outline.showProperties = false;
      outline.showConstants = false;
      outline.collapseItems = "alwaysCollapse";
      outline.icons = true;
      outline.problems.badges = true;
      terminal.integrated.cursorBlinking = true;
      terminal.integrated.cursorStyle = "line";
      terminal.integrated.customGlyphs = true;
      terminal.integrated.enableImages = true;
      terminal.integrated.env.linux = { };
      terminal.integrated.fontFamily = "MonaspiceNe Nerd Font";
      terminal.integrated.gpuAcceleration = "auto";
      terminal.integrated.smoothScrolling = true;
      terminal.integrated.tabs.defaultColor = "terminal.ansiBlue";
      terminal.integrated.shellIntegration.decorationsEnabled = "gutter";
      terminal.integrated.shellIntegration.enabled = true;
      terminal.integrated.shellIntegration.suggestEnabled = true;
      terminal.external.linuxExec = "xterm";

      #extensions
      extensions.ignoreRecommendations = true;
      projectManager = {
        git.baseFolders = [
          "/home/mhiri/Documents"
          "/home/mhiri/projects"
          "/home/mhiri/Repos/Mhirii"
          "/home/mhiri/.config/vscode-neovim"
          "/home/mhirii/.config/qtile"
          "/home/mhirii/.config/awesome"
          "/home/mhirii/.config/hypr"
        ];
        sortList = "Recent";
        vscode.baseFolders = [ ];
        any.baseFolders = [ ];
        any.maxDepthRecursion = 1;
        git.MaxDepthRecursion = 4;
      };
      "todo-tree.general.showActivityBarBadge" = true;
      "todo-tree.general.showIconsInsteadOfTagsInStatusBar" = true;
      "todo-tree.general.statusBar" = "total";
      "todo-tree.highlights.useColourScheme" = true;
      "git.autofetch" = true;

      # vim
      "vscode-neovim" = {
        neovimExecutablePaths.linux = "${unstable_pkgs.neovim}/bin/nvim";
        NVIM_APPNAME = "vscode-neovim";
        neovimInitVimPaths.linux = "/home/mhiri/.config/vscode-neovim/init.lua";
      };
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
      "whichkey.useFullWidthCharacters" = true;

      #

      whichkey.bindings = [
        { "key" = ","; "name" = "Find Files"; "type" = "command"; "command" = "workbench.action.quickOpen"; }
        { "key" = "/"; "name" = "Grep"; "type" = "command"; "command" = "fzf-quick-open.runFzfSearch"; }
        { "key" = ";"; "name" = "Show commands"; "type" = "command"; "command" = "workbench.action.showCommands"; }
        { "key" = "."; "name" = "Code Action"; "type" = "command"; "command" = "editor.action.quickFix"; }
        { "key" = "e"; "name" = "Toggle Explorer"; "type" = "command"; "command" = "workbench.action.toggleSidebarVisibility"; }
        { "key" = "S"; "name" = "Find Here"; "type" = "command"; "command" = "surround.with"; }
        { "key" = "f"; "name" = "Find Here"; "type" = "command"; "command" = "workbench.action.quickOpen"; }
        { "key" = "-"; "name" = "Horizontal split"; "type" = "command"; "command" = "workbench.action.splitEditorDown"; }
        { "key" = "h"; "name" = "Hop Word"; "type" = "command"; "command" = "vscode-neovim.send"; "args" = "<C-g>"; }
        { "key" = "i"; "name" = "Invert Boolean"; "type" = "command"; "command" = "extension.toggleBool"; }
        { "key" = "k"; "name" = "Hover"; "type" = "command"; "command" = "editor.action.showHover"; }
        { "key" = "T"; "name" = "Toggle terminal"; "type" = "command"; "command" = "workbench.action.togglePanel"; }
        { "key" = "|"; "name" = "Vertical split"; "type" = "command"; "command" = "workbench.action.splitEditor"; }
        { "key" = "x"; "name" = "Close Buffer"; "type" = "command"; "command" = "workbench.action.closeActiveEditor"; }
        { "key" = "z"; "name" = "Toggle Zen mode"; "type" = "command"; "command" = "workbench.action.toggleZenMode"; }
        # /* ────────────────────────────── Code Actions ────────────────────────────── */
        {
          "key" = "c";
          "name" = "+Code Actions";
          "type" = "bindings";
          "bindings" = [
            { "key" = "a"; "name" = "Quick Fix"; "type" = "command"; "command" = "editor.action.quickFix"; }
            { "key" = "b"; "name" = "Comment box"; "type" = "command"; "command" = "comment-divider.makeMainHeader"; }
            { "key" = "d"; "name" = "Diagnostics"; "type" = "command"; "command" = "workbench.panel.markers.view.focus"; }
            { "key" = "e"; "name" = "Explain"; "type" = "command"; "command" = "codeium.explainCodeBlock"; }
            { "key" = "f"; "name" = "Format"; "type" = "command"; "command" = "editor.action.format"; }
            { "key" = "r"; "name" = "Rename"; "type" = "command"; "command" = "editor.action.rename"; }
            { "key" = "s"; "name" = "Symbols"; "type" = "command"; "command" = "workbench.action.gotoSymbol"; }
            { "key" = "D"; "name" = "Preview Declaration"; "type" = "command"; "command" = "editor.action.format"; }
          ];
        }
        /* ───────────────────────────────── Buffers ──────────────────────────────── */
        {
          "key" = "b";
          "name" = "+Buffers";
          "type" = "bindings";
          "bindings" = [
            { "key" = "d"; "name" = "delete buffer"; "type" = "command"; "command" = "workbench.action.closeActiveEditor"; }
            { "key" = "h"; "name" = "Move editor to left group"; "type" = "command"; "command" = "workbench.action.moveEditorToLeftGroup"; }
            { "key" = "j"; "name" = "Move editor to below group"; "type" = "command"; "command" = "workbench.action.moveEditorToBelowGroup"; }
            { "key" = "k"; "name" = "Move editor to above group"; "type" = "command"; "command" = "workbench.action.moveEditorToAboveGroup"; }
            { "key" = "l"; "name" = "Move editor to right group"; "type" = "command"; "command" = "workbench.action.moveEditorToRightGroup"; }
            { "key" = "N"; "name" = "New untitled file"; "type" = "command"; "command" = "workbench.action.files.newUntitledFile"; }
            { "key" = "s"; "name" = "Show all editor"; "type" = "command"; "command" = "workbench.action.showAllEditors"; }
            { "key" = "u"; "name" = "Reopen closed editor"; "type" = "command"; "command" = "workbench.action.reopenClosedEditor"; }
            { "key" = "o"; "name" = "Close other buffers"; "type" = "command"; "command" = "workbench.action.closeOtherEditors"; }
            { "key" = "p"; "name" = "Pin buffer"; "type" = "command"; "command" = "workbench.action.pinEditor"; }
            { "key" = "P"; "name" = "Pin buffer"; "type" = "command"; "command" = "workbench.action.unpinEditor"; }
            {
              "key" = "Y";
              "name" = "Copy buffer to clipboard";
              "type" = "commands";
              "commands" = [
                "editor.action.selectAll"
                "editor.action.clipboardCopyAction"
                "cancelSelection"
              ];
            }
          ];
        }
        /* ────────────────────────────────── Debug ───────────────────────────────── */
        {
          "key" = "d";
          "name" = "+Debug";
          "type" = "bindings";
          "bindings" = [
            { "key" = "b"; "name" = "Step back"; "type" = "command"; "command" = "workbench.action.debug.stepBack"; }
            { "key" = "c"; "name" = "Continue debug"; "type" = "command"; "command" = "workbench.action.debug.continue"; }
            { "key" = "i"; "name" = "Step into"; "type" = "command"; "command" = "workbench.action.debug.stepInto"; }
            { "key" = "j"; "name" = "Jump to cursor"; "type" = "command"; "command" = "debug.jumpToCursor"; }
            { "key" = "o"; "name" = "Step over"; "type" = "command"; "command" = "workbench.action.debug.stepOver"; }
            { "key" = "p"; "name" = "Pause debug"; "type" = "command"; "command" = "workbench.action.debug.pause"; }
            { "key" = "q"; "name" = "Quit debug"; "type" = "command"; "command" = "workbench.action.debug.stop"; }
            { "key" = "r"; "name" = "Run without debug"; "type" = "command"; "command" = "workbench.action.debug.run"; }
            { "key" = "R"; "name" = "Toggle REPL"; "type" = "command"; "command" = "workbench.debug.action.toggleRepl"; }
            { "key" = "s"; "name" = "Start debug"; "type" = "command"; "command" = "workbench.action.debug.start"; }
            { "key" = "S"; "name" = "Restart debug"; "type" = "command"; "command" = "workbench.action.debug.restart"; }
            { "key" = "t"; "name" = "Toggle breakpoint"; "type" = "command"; "command" = "editor.debug.action.toggleBreakpoint"; }
            { "key" = "T"; "name" = "Toggle inline breakpoint"; "type" = "command"; "command" = "editor.debug.action.toggleInlineBreakpoint"; }
            { "key" = "u"; "name" = "Step out"; "type" = "command"; "command" = "workbench.action.debug.stepOut"; }
            { "key" = "w"; "name" = "Focus on watch view"; "type" = "command"; "command" = "workbench.debug.action.focusWatchView"; }
            { "key" = "W"; "name" = "Add to watch"; "type" = "command"; "command" = "editor.debug.action.selectionToWatch"; }
            { "key" = "v"; "name" = "Debug View"; "type" = "command"; "command" = "workbench.debug.welcome.focus"; }
          ];
        }
        /* ────────────────────────────────── Find ────────────────────────────────── */
        {
          "key" = "F";
          "name" = "+Find/File";
          "type" = "bindings";
          "bindings" = [
            { "key" = "a"; "name" = "Find Here"; "type" = "command"; "command" = "actions.find"; }
            { "key" = "f"; "name" = "Find Files"; "type" = "command"; "command" = "binocular.searchFile"; }
            { "key" = "d"; "name" = "Find Directory"; "type" = "command"; "command" = "binocular.searchDirectory"; }
            { "key" = "s"; "name" = "Find Symbol"; "type" = "command"; "command" = "workbench.action.gotoMethod"; }
            { "key" = "o"; "name" = "Find Symbol"; "type" = "command"; "command" = "workbench.action.gotoSymbol"; }
            { "key" = "t"; "name" = "Find Text In Files"; "type" = "command"; "command" = "workbench.action.findInFiles"; }
            { "key" = "m"; "name" = "Format"; "type" = "command"; "command" = "editor.action.format"; }
            { "key" = "w"; "name" = "Word Hop"; "type" = "command"; "command" = "vscode-neovim.send"; "args" = "<C-g>"; }
          ];
        }
        /* ───────────────────────────── Github Copilot ───────────────────────────── */
        {
          "key" = "g";
          "name" = "+Copilot";
          "type" = "bindings";
          "bindings" = [
            { "key" = "c"; "name" = "Collect Diagnostics"; "type" = "command"; "command" = "github.copilot.collectDiagnostics"; }
            { "key" = "d"; "name" = "Generate Docs"; "type" = "command"; "command" = "github.copilot.interactiveEditor.generateDocs"; }
            { "key" = "f"; "name" = "Fix this"; "type" = "command"; "command" = "github.copilot.interactiveEditor.fix"; }
            { "key" = "e"; "name" = "Explain"; "type" = "command"; "command" = "github.copilot.interactiveEditor.explain"; }
            { "key" = "t"; "name" = "Generate Test"; "type" = "command"; "command" = "github.copilot.interactiveEditor.generateTests"; }
          ];
        }
        /* ───────────────────────────────── Insert ───────────────────────────────── */
        {
          "key" = "I";
          "name" = "+Insert";
          "type" = "bindings";
          "bindings" = [
            { "key" = "j"; "name" = "Insert line below"; "type" = "command"; "command" = "editor.action.insertLineAfter"; }
            { "key" = "k"; "name" = "Insert line above"; "type" = "command"; "command" = "editor.action.insertLineBefore"; }
            { "key" = "s"; "name" = "Insert snippet"; "type" = "command"; "command" = "editor.action.insertSnippet"; }
          ];
        }
        /* ────────────────────────────────── Marks ───────────────────────────────── */
        {
          "key" = "m";
          "name" = "+Marks";
          "type" = "bindings";
          "bindings" = [
            { "key" = "l"; "name" = "All Bookmarks List"; "type" = "command"; "command" = "bookmarks.listFromAllFiles"; }
            { "key" = "L"; "name" = "Current Buffer Bookmarks List"; "type" = "command"; "command" = "bookmarks.list"; }
            { "key" = "t"; "name" = "Toggle Bookmarks"; "type" = "command"; "command" = "bookmarks.toggle"; }
            { "key" = "a"; "name" = "Toggle Bookmarks"; "type" = "command"; "command" = "bookmarks.toggleLabeled"; }
            { "key" = "d"; "name" = "delete Bookmarks in buffer"; "type" = "command"; "command" = "bookmarks.clear"; }
            { "key" = "D"; "name" = "delete Bookmarks in all buffer"; "type" = "command"; "command" = "bookmarks.clearFromAllFiles"; }
          ];
        }
        /* ───────────────────────────────── Preview ──────────────────────────────── */
        {
          "key" = "p";
          "name" = "+Preview/project";
          "type" = "bindings";
          "bindings" = [
            { "key" = "d"; "name" = "Declaration"; "type" = "command"; "command" = "editor.action.peekDefinition"; }
            { "key" = "D"; "name" = "Declaration"; "type" = "command"; "command" = "editor.action.previewDeclaration"; }
            { "key" = "f"; "name" = "Find file in projects"; "type" = "command"; "command" = "binocular.searchFileConfiguredFolders"; }
            { "key" = "i"; "name" = "Implementation"; "type" = "command"; "command" = "editor.action.peekImplementation"; }
            { "key" = "l"; "name" = "Plugins"; "type" = "command"; "command" = "workbench.view.extensions"; }
            { "key" = "m"; "name" = "Project Manager"; "type" = "command"; "command" = "projectsExplorerFavorites.focus"; }
            { "key" = "p"; "name" = "Find directory in projects"; "type" = "command"; "command" = "binocular.searchDirectoryConfiguredFolders"; }
            { "key" = "r"; "name" = "Reference"; "type" = "command"; "command" = "references-view.showCallHierarchy"; }
            { "key" = "t"; "name" = "Type Definition"; "type" = "command"; "command" = "editor.action.peekTypeDefinition"; }
            { "key" = "/"; "name" = "Find Text in projects"; "type" = "command"; "command" = "binocular.searchContentConfiguredFolders"; }
          ];
        }
        /* ──────────────────────────────── Refactor ──────────────────────────────── */
        {
          "key" = "r";
          "name" = "+Refactor";
          "type" = "bindings";
          "bindings" = [
            { "key" = "a"; "name" = "Codeium Refactor"; "type" = "command"; "command" = "codeium.refactorCodeBlock"; }
            { "key" = "p"; "name" = "Replace in Project"; "type" = "command"; "command" = "workbench.action.replaceInFiles"; }
            { "key" = "f"; "name" = "Find and Replace"; "type" = "command"; "command" = "editor.action.startFindReplaceAction"; }
            { "key" = "s"; "name" = "Rename Symbol"; "type" = "command"; "command" = "editor.action.rename"; "when" = "editorHasRenameProvider && editorTextFocus && !editorReadonly"; }
            { "key" = "c"; "name" = "refactor"; "type" = "command"; "command" = "editor.action.refactor"; }
          ];
        }
        /* ───────────────────────────────── Search ───────────────────────────────── */
        {
          "key" = "s";
          "name" = "+Show/Search";
          "type" = "bindings";
          "bindings" = [
            { "key" = "b"; "name" = "Buffers"; "type" = "command"; "command" = "workbench.action.showAllEditors"; }
            { "key" = "d"; "name" = "Todo"; "type" = "command"; "command" = "todo-tree-view.focus"; }
            { "key" = "e"; "name" = "Explorer"; "type" = "command"; "command" = "workbench.view.explorer"; }
            { "key" = "f"; "name" = "Find in buffer"; "type" = "command"; "command" = "actions.find"; }
            { "key" = "g"; "name" = "Git"; "type" = "command"; "command" = "workbench.view.scm"; }
            { "key" = "m"; "name" = "Bookmarks"; "type" = "command"; "command" = "bookmarks.listFromAllFiles"; }
            { "key" = "o"; "name" = "Output"; "type" = "command"; "command" = "workbench.action.gotoSymbol"; }
            { "key" = "O"; "name" = "Output"; "type" = "command"; "command" = "workbench.action.output.toggleOutput"; }
            { "key" = "p"; "name" = "Problems"; "type" = "command"; "command" = "workbench.actions.view.problems"; }
            { "key" = "r"; "name" = "Remote explorer"; "type" = "command"; "command" = "workbench.view.remote"; }
            { "key" = "s"; "name" = "Search"; "type" = "command"; "command" = "workbench.view.search"; }
            { "key" = "t"; "name" = "TODO"; "type" = "command"; "command" = "todo-tree-view.focus"; }
            { "key" = "x"; "name" = "Extensions"; "type" = "command"; "command" = "workbench.view.extensions"; }
          ];
        }
        /* ──────────────────────────────── Toggle UI ─────────────────────────────── */
        {
          "key" = "t";
          "name" = "+Toggle UI";
          "type" = "bindings";
          "bindings" = [
            { "key" = "a"; "name" = "Toggle activity bar"; "type" = "command"; "command" = "workbench.action.toggleActivityBarVisibility"; }
            { "key" = "f"; "name" = "Toggle full screen"; "type" = "command"; "command" = "workbench.action.toggleFullScreen"; }
            { "key" = "m"; "name" = "Toggle Bookmarks panel"; "type" = "command"; "command" = "bookmarksExplorer.focus"; }
            { "key" = "p"; "name" = "Toggle panel"; "type" = "command"; "command" = "workbench.action.togglePanel"; }
            { "key" = "r"; "name" = "SSH View"; "type" = "command"; "command" = "remoteTargets.focus"; }
            { "key" = "s"; "name" = "Toggle sidebar"; "type" = "command"; "command" = "workbench.action.toggleSidebarVisibility"; }
            { "key" = "t"; "name" = "Todo View"; "type" = "command"; "command" = "workbench.view.extension.todo-tree-container"; }
            { "key" = "g"; "name" = "View Git Pod"; "type" = "command"; "command" = "workbench.view.extension.gitpod-view"; }
            { "key" = "h"; "name" = "Switch Theme"; "type" = "command"; "command" = "workbench.action.selectTheme"; }
          ];
        }
        /* ───────────────────────────────── Window ───────────────────────────────── */
        {
          "key" = "w";
          "name" = "+Window";
          "type" = "bindings";
          "bindings" = [
            { "key" = "c"; "name" = "Close editor group"; "type" = "command"; "command" = "workbench.action.closeEditorsInGroup"; }
            { "key" = "h"; "name" = "Move editor group left"; "type" = "command"; "command" = "workbench.action.moveActiveEditorGroupLeft"; }
            { "key" = "j"; "name" = "Move editor group down"; "type" = "command"; "command" = "workbench.action.moveActiveEditorGroupDown"; }
            { "key" = "k"; "name" = "Move editor group up"; "type" = "command"; "command" = "workbench.action.moveActiveEditorGroupUp"; }
            { "key" = "l"; "name" = "Move editor group right"; "type" = "command"; "command" = "workbench.action.moveActiveEditorGroupRight"; }
            { "key" = "m"; "name" = "Maximize editor group"; "type" = "command"; "command" = "workbench.action.minimizeOtherEditors"; }
            { "key" = "M"; "name" = "Maximize editor group and hide side bar"; "type" = "command"; "command" = "workbench.action.maximizeEditor"; }
            { "key" = "p"; "name" = "Focus previous editor group"; "type" = "command"; "command" = "workbench.action.focusPreviousGroup"; }
            { "key" = "t"; "name" = "Toggle editor group sizes"; "type" = "command"; "command" = "workbench.action.toggleEditorWidths"; }
            { "key" = "x"; "name" = "Close all editor groups"; "type" = "command"; "command" = "workbench.action.closeAllGroups"; }
            { "key" = "z"; "name" = "Combine all editors"; "type" = "command"; "command" = "workbench.action.joinAllGroups"; }
            { "key" = "="; "name" = "Reset editor group sizes"; "type" = "command"; "command" = "workbench.action.evenEditorWidths"; }
          ];
        }
      ];

      #

    };
  };
}
