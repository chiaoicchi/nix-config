{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;

    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (
        p: with p; [
          bash
          c
          cpp
          dockerfile
          hcl
          json
          latex
          lua
          markdown
          markdown_inline
          nix
          ocaml
          ocaml_interface
          python
          rust
          terraform
          toml
          yaml
        ]
      ))

      telescope-nvim
      plenary-nvim

      nvim-web-devicons
    ];

    extraPackages = with pkgs; [
      # Nix
      nixd
      nixfmt

      # Lua
      lua-language-server

      # for telescope
      ripgrep
      fd
    ];
  };

  xdg.configFile."nvim/init.lua".source = ./init.lua;
}
