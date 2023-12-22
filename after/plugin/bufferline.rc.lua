local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return vim.notify('COULD NOT LOAD BUFFERLINE', vim.log.levels.ERROR, { title = 'BUFFERLINE' })
end

bufferline.setup {
  options = {
    themable = true,
    numbers = 'ordinal',
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
    diagnostics = 'nvim_lsp',
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<A-1>', function () bufferline.go_to(1, true) end, opts)
keymap.set('n', '<A-2>', function () bufferline.go_to(2, true) end, opts)
keymap.set('n', '<A-3>', function () bufferline.go_to(3, true) end, opts)
keymap.set('n', '<A-4>', function () bufferline.go_to(4, true) end, opts)
keymap.set('n', '<A-5>', function () bufferline.go_to(5, true) end, opts)
keymap.set('n', '<A-6>', function () bufferline.go_to(6, true) end, opts)
keymap.set('n', '<A-7>', function () bufferline.go_to(7, true) end, opts)
keymap.set('n', '<A-8>', function () bufferline.go_to(8, true) end, opts)
keymap.set('n', '<A-9>', function () bufferline.go_to(9, true) end, opts)
keymap.set('n', '<A-0>', function () bufferline.go_to(-1, true) end, opts)

keymap.set('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)
keymap.set('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)

keymap.set('n', '<A-Right>', ':BufferLineMoveNext<CR>', opts)
keymap.set('n', '<A-Left>', ':BufferLineMovePrev<CR>', opts)

keymap.set('n', '<A-x>', ':bdelete!<CR>', opts)
