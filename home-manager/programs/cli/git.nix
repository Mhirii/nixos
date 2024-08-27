{ pkgs, ... }:
let name = "Mhirii"; in
{

  home.packages = with pkgs; [
    delta
    gh
    glab
  ];

  programs.git = {
    enable = true;
    userName = name;
    userEmail = "ahmedmhiri218@gmail.com";


    extraConfig = {
      init.defaultBranch = "main";
      color.ui = true;
      github.user = name;
      push.autoSetupRemote = true;

      core = {
        editor = "nvim";
        pager = "${pkgs.delta}/bin/delta";
      };

      diff.lockb = {
        textconv = "bun";
        binary = true;
      };

      credential = {
        "https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
        "https://gist.github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
        "https://gitlab.com".helper = "!${pkgs.glab}/bin/glab auth git-credential";
        helper = "store";
      };

      color = {
        branch = {
          current = "cyan bold reverse";
          local = "white";
          remote = "cyan";
        };
        diff = {
          func = "cyan";
          whitespace = "magenta reverse";
          meta = "white";
          frag = "cyan bold reverse";
          old = "red";
          new = "green";
        };
        grep.linenumber = "white";
        status = {
          added = "green";
          changed = "yellow";
          remoteBranch = "cyan";
          unmerged = "magenta bold reverse";
          untracked = "red";
          updated = "green bold";
        };
      };
      calendar = {
        format = "ascii";
        period = 5;
      };
    };

    delta = {
      enable = true;
      options = {
        features = "decorations";
        side-by-side = true;
        interactive.keep-plus-minus-markers = false;
      };
    };

    # diff-so-fancy.enable = true;
  };
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
  services.ssh-agent.enable = true;
}
