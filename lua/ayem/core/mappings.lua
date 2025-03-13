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

keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)

keymap.set('n', '<ESC><ESC>', '<CMD>nohlsearch<CR>', opts)
keymap.set('n', '<C-w>', '<CMD>setlocal wrap! nowrap?<CR>', opts)

keymap.set('n', '<C-t>', '<CMD>tabnew<CR>', opts)
keymap.set('n', '<C-x>', '<CMD>tabclose<CR>', opts)
keymap.set('n', '<A-,>', '<CMD>tabprevious<CR>', opts)
keymap.set('n', '<A-.>', '<CMD>tabnext<CR>', opts)
keymap.set('n', '<A-1>', '<CMD>tabfirst<CR>', opts)
keymap.set('n', '<A-0>', '<CMD>tablast<CR>', opts)
