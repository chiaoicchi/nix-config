vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

for type, icon in pairs({ Error = " ", Warn = " ", Hint = " ", Info = " " }) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, silent = true })

    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1 })
    end, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1 })
    end, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "[e", function()
      vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
    end, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "]e", function()
      vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
    end, { buffer = bufnr, silent = true })

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormat_" .. bufnr, { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})
vim.lsp.config("nil_ls", {
  cmd = { "nil" },
  filetypes = { "nix" },
})
vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "Cargo.lock" },
})
vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "pyrightconfig.json" },
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
  },
})
vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml" },
})
vim.lsp.config("terraformls", {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars", "hcl" },
  root_markers = { ".terraform" },
})
vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = { "compile_commands.json", ".clangd", "CMakeLists.txt", "Makefile" },
})
vim.lsp.config("yamlls", {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose" },
  settings = {
    yaml = {
      schemas = {
        kubernetes = "/*.k8s.yaml",
      },
    },
  },
})
vim.lsp.config("dockerls", {
  cmd = { "docker-language-server", "start", "--stdio" },
  filetypes = { "dockerfile" },
})
vim.lsp.enable({ "lua_ls", "nil_ls", "rust_analyzer", "pyright", "ruff", "terraformls", "clangd", "yamlls", "dockerls" })

require("blink.cmp").setup({
  keymap = {
    preset = "default",
  },
  sources = {
    default = { "lsp", "path", "buffer" },
  },
  completion = {
    documentation = {
      auto_show = true,
    },
  },
})
