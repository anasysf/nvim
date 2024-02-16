local ok, tree = pcall(require, 'nvim-tree')
if not ok then
  return vim.notify('COULD NOT LOAD NVIM TREE', vim.log.levels.ERROR, { title = 'NVIM TREE' })
end

tree.setup({
  sort = {
    sorter = 'case_sensitive',
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>o', ':NvimTreeToggle<CR>', opts)
