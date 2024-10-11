local keymap = vim.keymap
local opts = { silent = true }

keymap.set('n', '<C-e>', '<CMD>Ex<CR>', opts)
keymap.set('n', '<A-x>', '<CMD>bdelete<CR>', opts)
