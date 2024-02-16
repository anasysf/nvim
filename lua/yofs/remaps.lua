local keymap = vim.keymap
local opts = { noremap = false, silent = true }

keymap.set('n', '<leader>+', '<C-a>', opts)
keymap.set('n', '<leader>-', '<C-x>', opts)
