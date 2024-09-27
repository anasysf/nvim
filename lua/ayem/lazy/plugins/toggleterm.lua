return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = true,
  init = function ()
    local keymap = vim.keymap
    local opts = { silent = true }

    keymap.set('n', '<C-t>', '<CMD>ToggleTerm direction=horizontal<CR>', opts)
    keymap.set('t', '<ESC>', '<C-\\><C-n>', opts)
  end,
}
