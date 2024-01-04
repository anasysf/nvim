local ok, lspsaga = pcall(require, 'lspsaga')
if not ok then
  return vim.notify('COULD NOT LOAD LSPSAGA', vim.log.levels.ERROR, { title = 'LSPSAGA' })
end

lspsaga.setup {
  lightbulb = {
    enable = false,
  },
  diagnostic = {
    show_code_action = false,
  },
}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>ic', ':Lspsaga incoming_calls<CR>', opts)
keymap.set('n', '<leader>oc', ':Lspsaga outgoing_calls<CR>', opts)
keymap.set('n', '<leader>pd', ':Lspsaga peek_definition<CR>', opts)
keymap.set('n', '<leader>ptd', ':Lspsaga peek_type_definition<CR>', opts)
keymap.set('n', '<leader>lf', ':Lspsaga finder<CR>', opts)
keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts)
keymap.set('n', '<leader>f', ':Lspsaga show_line_diagnostics<CR>', opts)
keymap.set('n', '<leader>cf', ':Lspsaga show_cursor_diagnostics<CR>', opts)
keymap.set('n', '<leader>pf', ':Lspsaga diagnostic_jump_prev<CR>', opts)
keymap.set('n', '<leader>nf', ':Lspsaga diagnostic_jump_next<CR>', opts)
