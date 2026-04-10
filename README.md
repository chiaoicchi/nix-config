# nix-config

Home Manager configuration for macOS (Apple Silicon).

## Features

- Reproducible dev environment with Nix flakes
- Neovim 0.11+ with native LSP, Treesitter, format on save
- Project-local LSPs via devShell/direnv
- Keyboard-driven workflow

## Stack

- **Shell**: Zsh + Starship + direnv
- **Editor**: Neovim (LSP, Treesitter, Telescope, blink.cmp)
- **Terminal**: Alacritty + Tmux
- **Git**: delta, rebase workflow

## Setup

Requires [Nix](https://nixos.org/) with flakes enabled.

```bash
nix run home-manager -- switch --flake .#chiaoi@mac
```

## Customization

1. Fork this repository
2. Update `flake.nix`: change `username`, `gitUsername`, `gitEmail`
3. Apply: `home-manager switch --flake .#<username>@mac`
