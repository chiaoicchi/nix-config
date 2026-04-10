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
      onedark-nvim
      nvim-treesitter.withAllGrammars
      nvim-autopairs
      nvim-web-devicons
      telescope-nvim
      plenary-nvim
      nui-nvim
      neo-tree-nvim
      gitsigns-nvim
      lualine-nvim
      blink-cmp
    ];

    extraPackages = with pkgs; [
      lua-language-server
      nil
      nixpkgs-fmt
      stylua
      ripgrep
      fd
    ];
  };

  xdg.configFile = {
    "nvim/init.lua".source = ./lua/init.lua;
    "nvim/lua/options.lua".source = ./lua/options.lua;
    "nvim/lua/gui.lua".source = ./lua/gui.lua;
    "nvim/lua/editor.lua".source = ./lua/editor.lua;
    "nvim/lua/finder.lua".source = ./lua/finder.lua;
    "nvim/lua/lsp.lua".source = ./lua/lsp.lua;
  };
}
