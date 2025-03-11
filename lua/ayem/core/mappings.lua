local g = vim.g

g.mapleader = ' '
g.maplocalleader = '\\'

local keymap = vim.keymap
local opts = { silent = true, noremap = true }

keymap.set('n', '<C-e>', '<CMD>Explore<CR>', opts)
keymap.set('n', '<C-o>', '<CMD>Vexplore<CR>', opts)
keymap.set('n', '<A-x>', '<CMD>bdelete<CR>', opts)
keymap.set('n', '<C-a>', 'ggVG', opts)
keymap.set('n', '<leader>rn', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
