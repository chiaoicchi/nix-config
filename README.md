# nix-config

## Environment

- Nix flake for reproducible development Environment

## Setup

### Prerequisites

- [Nix](https://nixos.org/) with flakes enabled

### Getting Started

1. Apply the configuration on macOS (Apple Silicon):

```bash
nix run home-manager -- switch --flake .#username@mac
```

Replace `username` with your actual username.
