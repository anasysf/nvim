local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set({ 'n', 'v' }, '<C-a>', 'ggVG', opts)
keymap.set('t', '<ESC>', '<C-\\><C-n>', opts)
