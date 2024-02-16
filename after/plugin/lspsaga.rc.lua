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
})

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>rn', ':Lspsaga rename<CR>', opts)
keymap.set({ 'n', 'v' }, '<leader>ca', ':Lspsaga code_action<CR>', opts)
keymap.set('n', '<leader>f', ':Lspsaga show_line_diagnostics<CR>', opts)
keymap.set('n', '<leader>np', ':Lspsaga diagnostic_jump_prev<CR>', opts)
keymap.set('n', '<leader>nf', ':Lspsaga diagnostic_jump_next<CR>', opts)
