local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.maplocalleader = '\\'

opt.guicursor = 'n-v-c-i:block'

opt.number = true
opt.relativenumber = true

opt.termguicolors = true

opt.colorcolumn = '80'

opt.list = true

local space = '·'
opt.listchars:append {
  tab = '│─',
  multispace = space,
  lead = space,
  trail = space,
  nbsp = space,
}
