local opt = vim.opt
local g = vim.g

opt.nu = true
opt.relativenumber = true

opt.errorbells = false
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.isfname:append '@-@'

opt.cmdheight = 1

opt.updatetime = 50

opt.shortmess:append 'c'

opt.colorcolumn = '80'

opt.background = 'dark'

opt.guicursor = 'n-v-c-i:block'

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
