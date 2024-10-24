local opt = vim.opt

opt.guicursor = 'n-v-c-i:block'

opt.number = true
opt.relativenumber = true

opt.colorcolumn = '100'
opt.signcolumn = 'yes'

opt.list = true

opt.termguicolors = true

opt.cursorline = true
opt.scrolloff = 10

local space = '·'
opt.listchars:append {
  tab = '│─',
  multispace = space,
  lead = space,
  trail = space,
  nbsp = space,
}
