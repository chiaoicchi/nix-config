#!/usr/bin/env bash
set -euo pipefail

cd "$CLAUDE_PROJECT_DIR"

if ! nix flake check; then
  echo "nix flake check failed" >&2
  exit 2
fi
