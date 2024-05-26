local g = vim.g
local keymap = vim.keymap

g.mapleader = ' '

keymap.set('n', '<C-a>', 'ggVG')
keymap.set('n', '<A-x>', '<CMD>bdelete<CR>')
