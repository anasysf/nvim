local keymap = vim.keymap
local opts = { noremap = false, silent = true }

keymap.set({ 'n', 'v' }, '<A-+>', '<C-a>', opts)
keymap.set({ 'n', 'v' }, '<C-x>', opts)

keymap.set({ 'n', 'v' }, '<C-a>', 'ggVG', opts)
