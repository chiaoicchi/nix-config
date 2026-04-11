{ pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
    nixpkgs-fmt
    stylua
  ];

  home.file.".claude/settings.json".force = true;
  home.file.".claude/settings.json".text = builtins.toJSON {
    model = "claude-opus-4-6";
    effortLevel = "high";
    theme = "dark";
    editorMode = "vim";
    statusline = {
      enabled = true;
      items = [
        "context"
        "cost"
      ];
    };
    permissions = {
      allow = [
        "Read"
        "Bash(git status *)"
        "Bash(git diff *)"
        "Bash(git log *)"
        "Bash(git show *)"
        "Bash(git blame *)"
        "Bash(git branch *)"
        "Bash(git stash *)"
        "Bash(git fetch *)"
        "Bash(nix build *)"
        "Bash(nix develop *)"
        "Bash(nix eval *)"
        "Bash(nix flake show *)"
        "Bash(nix flake check *)"
        "Bash(nix flake metadata *)"
        "Bash(* --help)"
        "Bash(* --version)"
      ];
      deny = [
        # system
        "Bash(sudo *)"
        "Bash(darwin-rebuild *)"
        "Bash(darwin-rebuild)"
        "Bash(home-manager *)"
        "Bash(home-manager)"
        # macOS
        "Bash(defaults write *)"
        "Bash(launchctl *)"
        "Bash(diskutil *)"
        "Bash(networksetup *)"
        "Bash(softwareupdate *)"
        "Bash(brew *)"
        # git
        "Bash(git commit *)"
        "Bash(git commit)"
        "Bash(git push *)"
        "Bash(git push)"
        "Bash(git reset --hard *)"
        "Bash(git reset --hard)"
        "Bash(git clean *)"
        "Bash(git branch -D *)"
        # destructive
        "Bash(rm -rf *)"
        "Bash(rm -r *)"
        # nix
        "Bash(nix profile *)"
        "Bash(nix-env *)"
        "Bash(nix-collect-garbage *)"
        "Bash(nix-collect-garbage)"
        # secrets
        "Read(~/.ssh/*)"
      ];
    };
    sandbox = {
      enabled = true;
      filesystem = {
        denyRead = [
          "~/.ssh"
        ];
      };
    };
  };

  home.file.".claude/CLAUDE.md".source = ./CLAUDE.md;
}
