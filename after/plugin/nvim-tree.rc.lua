local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return vim.notify('COULD NOT LOAD NVIM-TREE', vim.log.levels.ERROR, { title = 'NVIM-TREE' })
end

nvim_tree.setup {}

local keymap = vim.keymap
local opts = { silent = true, noremap = true }

keymap.set('n', '<C-n>', '<CMD>NvimTreeToggle<CR>', opts)
