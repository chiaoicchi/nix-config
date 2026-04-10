require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { preview_width = 0.5 },
    },
  },
  pickers = {
    find_files = { hidden = true },
  },
})

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").git_files, { silent = true })
vim.keymap.set("n", "<leader>fa", require("telescope.builtin").find_files, { silent = true })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { silent = true })

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})

vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>", { silent = true })
