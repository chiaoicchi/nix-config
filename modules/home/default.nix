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
    ./multiplexer.nix
    ./ssh.nix
    ./terminal.nix
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
