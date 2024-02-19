local g = vim.g
local opt = vim.opt

g.mapleader = ' '

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.guicursor = 'n-v-c-i:block'

opt.relativenumber = true
opt.number = true

opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

opt.backspace = 'indent,eol,start'

opt.wrap = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.conceallevel = 0
