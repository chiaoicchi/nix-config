{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars

      {
        plugin = nvim-autopairs;
        type = "lua";
        config = ''
          require('nvim-autopairs').setup({ check_ts = true })
        '';
      }

      telescope-nvim
      plenary-nvim

      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = "require('gitsigns').setup()";
      }
    ];

    extraLuaConfig = builtins.readFile ./lua/init.lua;
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
    "nvim/lua/options.lua".source = ./lua/options.lua;
    "nvim/lua/keymaps.lua".source = ./lua/keymaps.lua;
    "nvim/lua/telescope_config.lua".source = ./lua/telescope_config.lua;
    "nvim/lua/lsp.lua".source = ./lua/lsp.lua;
  };
}
