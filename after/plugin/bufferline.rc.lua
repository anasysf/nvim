local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return vim.notify(
    'COULD NOT LOAD BUFFERLINE',
    vim.log.levels.ERROR,
    { title = 'BUFFERLINE' }
  )
end

local bufdelete_ok, bufdelete = pcall(require, 'bufdelete')
if not bufdelete_ok then
  return vim.notify('COULD NOT LOAD BUFDELETE', vim.log.levels.ERROR, { title = 'BUFDELETE' })
end

bufferline.setup({
  highlights = require('catppuccin.groups.integrations.bufferline').get(),
  options = {
    numbers = 'ordinal',
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'NvimTree',
        text = function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t') end,
        highlight = 'Directory',
        text_align = 'left',
      },
    },
    indicator = {
      style = 'underline',
    },
  },
})

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)
keymap.set('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)

keymap.set('n', '<A-Left>', ':BufferLineMovePrev<CR>', opts)
keymap.set('n', '<A-Right>', ':BufferLineMoveNext<CR>', opts)

keymap.set('n', '<A-x>', function() return bufdelete.bufdelete(0, true) end, opts)
