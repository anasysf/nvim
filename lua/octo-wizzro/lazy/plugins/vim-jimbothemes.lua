return {
  'i3d/vim-jimbothemes',
  config = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme 'breakingbad'

    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#404040' })
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  end,
}
