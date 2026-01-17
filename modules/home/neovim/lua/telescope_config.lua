local telescope = require('telescope')
local builtin = require('telescope.builtin')
local keymap = vim.keymap.set

telescope.setup({
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

keymap("n", "<leader>ff", builtin.git_files)
keymap("n", "<leader>fa", builtin.find_files)
keymap("n", "<leader>fg", builtin.live_grep)
