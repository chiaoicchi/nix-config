{ pkgs
, gitUsername
, gitEmail
, ...
}:
{
  imports = [
    ./git.nix
    ./neovim
    ./shell.nix
    ./tmux.nix
    ./ssh.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    curl
    claude-code
    nerd-fonts.hack
  ];

  _module.args = {
    inherit gitUsername gitEmail;
  };
}
