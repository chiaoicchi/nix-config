vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = ""
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })
