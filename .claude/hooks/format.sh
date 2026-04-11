#!/usr/bin/env bash
set -euo pipefail

input=$(cat)
file_path=$(echo "$input" | jq -r '.tool_input.file_path // .tool_input.filePath // empty')

if [[ -z "$file_path" ]]; then
  exit 0
fi

case "$file_path" in
  *.nix)
    command -v nixpkgs-fmt >/dev/null && nixpkgs-fmt "$file_path"
    ;;
  *.lua)
    command -v stylua >/dev/null && stylua "$file_path"
    ;;
esac
