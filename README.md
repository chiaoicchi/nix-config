# nix-config

Home Manager configuration for macOS (Apple Silicon).

## Features

- Reproducible dev environment with Nix flakes
- Minimal Neovim setup (LSP + Treesitter)
- Project-local config via `.nvim.lua` with format on save
- No mouse (keyboard-driven workflow)

## Stack

- **Shell**: Zsh + Starship + direnv
- **Editor**: Neovim (LSP, Treesitter, Telescope)
- **Terminal**: Alacritty + Tmux
- **Git**: delta, rebase workflow
- **Packages**: curl, claude-code, Hack Nerd Font

## Setup

Requires [Nix](https://nixos.org/) with flakes enabled.

```bash
nix run home-manager -- switch --flake .#chiaoi@mac
```

## Customization

1. Fork this repository
2. Update `flake.nix`: change `username`, `gitUsername`, `gitEmail`
3. Update `hosts/mac.nix`: change `home.username` and `home.homeDirectory`
4. Apply: `home-manager switch --flake .#<username>@mac`
