return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavour = 'mocha',
    transparent_background = false,
    integrations = {
      telescope = {
        enabled = true,
      },
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      lsp_saga = true,
      markdown = true,
    },
  },
  init = function()
    return vim.cmd.colorscheme 'catppuccin'
  end,
}
