local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.updatetime = 250
opt.timeoutlen = 300

opt.exrc = true
local function load_git_root_exrc()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
  if vim.v.shell_error == 0 and git_root then
    local exrc_path = git_root .. "/.nvim.lua"
    if vim.fn.filereadable(exrc_path) == 1 then
      vim.cmd("source " .. vim.fn.fnameescape(exrc_path))
    end
  end
end

load_git_root_exrc()

vim.cmd("colorscheme default")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
