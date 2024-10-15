return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = true,
  init = function()
    local opt = vim.opt
    opt.background = 'dark'

    vim.cmd.colorscheme 'gruvbox'
  end,
  opts = {},
}
