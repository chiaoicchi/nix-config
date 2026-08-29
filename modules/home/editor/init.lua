vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.mouse = ""
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 })
  end,
})
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})
vim.lsp.config("nixd", {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
  settings = {
    nixd = {
      formatting = { command = { "nixfmt" } },
    },
  },
})
vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
})
vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = { "compile_commands.json", ".clangd", "CMakeLists.txt", "Makefile", ".git" },
})
vim.lsp.config("basedpyright", {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "pyrightconfig.json", ".git" },
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
    },
  },
})
vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".git" },
})
vim.lsp.config("terraform_ls", {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars", "hcl" },
  root_markers = { ".terraform", ".git" },
})
vim.lsp.config("bashls", {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_markers = { ".git" },
})
vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
})
vim.lsp.config("yamlls", {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      schemas = {
        kubernetes = "/*.k8s.yaml",
      },
    },
  },
})
vim.lsp.config("taplo", {
  cmd = { "taplo", "lsp", "stdio" },
  filetypes = { "toml" },
  root_markers = { ".git" },
})
vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
  root_markers = { ".git" },
})
vim.lsp.config("texlab", {
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_markers = { ".git" },
})
vim.lsp.config("ocamllsp", {
  cmd = { "ocamllsp" },
  filetypes = { "ocaml", "ocaml.interface" },
  root_markers = { "dune-project", ".git" },
})
vim.lsp.config("dockerls", {
  cmd = { "docker-language-server", "start", "--stdio" },
  filetypes = { "dockerfile" },
  root_markers = { ".git" },
})
vim.lsp.enable({
  "lua_ls",
  "nixd",
  "rust_analyzer",
  "clangd",
  "basedpyright",
  "ruff",
  "terraform_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "taplo",
  "marksman",
  "texlab",
  "ocamllsp",
  "dockerls",
})


local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (fd)" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep project (rg)" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search :help" })
