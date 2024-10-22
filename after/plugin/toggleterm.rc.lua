local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
  return vim.notify('COULD NOT LOAD TOGGLETERM', vim.log.levels.ERROR, { title = 'TOGGLETERM' })
end

local keymap = vim.keymap
local opts = { silent = true }
local trim_spaces = true

keymap.set('n', '<C-t>h', '<CMD>ToggleTerm direction=horizontal<CR>', opts)
keymap.set('n', '<C-t>v', '<CMD>ToggleTerm size=50 direction=vertical<CR>', opts)
keymap.set('n', '<C-t>f', '<CMD>ToggleTerm direction=float<CR>', opts)
keymap.set('v', '<C-t>s', function()
  toggleterm.send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count })
end)
