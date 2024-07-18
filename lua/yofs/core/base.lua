local opt = vim.opt
local g = vim.g

opt.nu = true
opt.relativenumber = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

opt.guicursor = 'n-v-c-i:block'

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.isfname:append '@-@'

opt.cmdheight = 1

opt.updatetime = 50

opt.colorcolumn = '80'

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.termguicolors = true
