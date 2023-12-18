local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
  return vim.notify('COULD NOT LOAD TOGGLETERM', vim.log.levels.ERROR, { title = 'TOGGLETERM' })
end

toggleterm.setup {}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', opts)
keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', opts)
keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', opts)
