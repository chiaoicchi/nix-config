{ gitUsername, gitEmail, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = gitUsername;
        email = gitEmail;
      };

      alias = {
        co = "checkout";
        br = "branch";
        st = "status";
        lg = "log --oneline --graph";
      };

      core = {
        editor = "nvim";
        quotepath = false;
      };

      init.defaultBranch = "main";

      push.autoSetupRemote = true;
      pull.rebase = true;
      rebase.autoStash = true;
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };

    ignores = [
      ".DS_Store"
      ".env"
    ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      side-by-side = true;
      line-numbers = true;
    };
  };
}
