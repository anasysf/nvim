local g = vim.g
local keymap = vim.keymap
local opts = { silent = true, noremap = false }

g.mapleader = ' '
g.maplocalleader = '\\'

keymap.set('n', '<C-a>', 'ggVG', opts)
