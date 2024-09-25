local keymap = vim.keymap
local opts = { silent = true }

keymap.set('n', '<C-e>', '<CMD>Explore<CR>', opts)
keymap.set('n', '<A-x>', '<CMD>bdelete<CR>', opts)
keymap.set({ 'n', 'v' }, '<C-a>', 'ggVG', opts)
