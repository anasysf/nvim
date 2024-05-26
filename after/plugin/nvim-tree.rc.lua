local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return vim.notify('COULD NOT LOAD NVIM-TREE', vim.log.levels.ERROR, { title = 'NVIM-TREE' })
end

nvim_tree.setup {
  sort = {
    sorter = 'case_sensitive',
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
}

local keymap = vim.keymap

keymap.set('n', '<C-n>', '<CMD>NvimTreeToggle<CR>')
