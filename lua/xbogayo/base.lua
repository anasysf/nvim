local g = vim.g
local opt = vim.opt

-- <leader>
g.mapleader = ' '

-- CURSOR
opt.guicursor = 'n-v-c-i:block'

-- INDENTATION
-- length of an actual \t character
opt.tabstop = 2
-- length to use when editing text (eg. TAB and BS keys)
-- (0 for ‘tabstop’, -1 for ‘shiftwidth’)
opt.softtabstop = -1
-- length to use when shifting text (eg. <<, >> and == commands)
-- (0 for ‘tabstop’)
opt.shiftwidth = 0
-- round indentation to multiples of 'shiftwidth' when shifting text
-- (so that it behaves like Ctrl-D / Ctrl-T)
opt.shiftround = true
-- if set, only insert spaces; otherwise insert \t and complete with spaces
opt.expandtab = true
-- reproduce the indentation of the previous line
opt.autoindent = true
-- try to be smart (increase the indenting level after ‘{’, decrease it after ‘}’, and so on)
opt.smartindent = true
-- a stricter alternative which works better for the C language
opt.cindent = true
-- use language‐specific plugins for indenting (better)
vim.cmd 'filetype plugin indent on'

-- RELATIVE NUMBERS
opt.relativenumber = true
