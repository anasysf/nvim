local ok, lspsaga = pcall(require, 'lspsaga')
if not ok then
  return vim.notify('COULD NOT LOAD LSPSAGA', vim.log.levels.ERROR, { title = 'LSPSAGA' })
end

lspsaga.setup({
  lightbulb = {
    enable = false,
  },
  diagnostic = {
    show_code_action = false,
  },
  ui = {
    kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
  },
})

local keymap = vim.keymap
local opts = { noremap = false, silent = true }

keymap.set('n', '<leader>ic', ':Lspsaga incoming_calls<CR>', opts)
keymap.set('n', '<leader>oc', ':Lspsaga outgoing_calls<CR>', opts)
keymap.set({ 'n', 'v' }, '<leader>ca', ':Lspsaga code_action<CR>', opts)
keymap.set('n', '<leader>D', ':Lspsaga peek_definition<CR>', opts)
keymap.set('n', '<leader>T', ':Lspsaga peek_type_definition<CR>', opts)
keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts)
