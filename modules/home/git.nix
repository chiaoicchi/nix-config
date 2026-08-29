{ osConfig, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = osConfig.my.git.name;
        email = osConfig.my.git.email;
      };

      init.defaultBranch = "main";

      push.autoSetupRemote = true;
      pull.rebase = true;
      rebase.autoStash = true;
    };

    ignores = [
      ".env"
    ];
  };
}
