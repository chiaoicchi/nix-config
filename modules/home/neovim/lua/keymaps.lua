vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<leader>c", ":bdelete<CR>", opts)

keymap("n", "<Esc>", ":nohlsearch<CR>", opts)
keymap("n", "<leader>e", ":Ex<CR>", opts)
