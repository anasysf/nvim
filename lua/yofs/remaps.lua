local keymap = vim.keymap
local opts = { noremap = false, silent = true }

keymap.set('n', '<A-+>', '<C-a>', opts)
keymap.set('n', '<A-->', '<C-x>', opts)

keymap.set('n', '<C-a>', 'ggVG', opts)
