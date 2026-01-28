local keymap = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    keymap("n", "gd", vim.lsp.buf.definition)
    keymap("n", "gr", vim.lsp.buf.references)
    keymap("n", "K", vim.lsp.buf.hover)

    keymap("n", "gl", vim.diagnostic.open_float)
    keymap("n", "[d", function()
      vim.diagnostic.jump({ count = -1 })
    end)
    keymap("n", "]d", function()
      vim.diagnostic.jump({ count = 1 })
    end)
    keymap("n", "[e", function()
      vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
    end)
    keymap("n", "]e", function()
      vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
    end)

    if client and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
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
vim.lsp.enable("lua_ls")
vim.lsp.enable("nil_ls")
