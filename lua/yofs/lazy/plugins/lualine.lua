return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    sections = {
      lualine_c = {
        'lsp_progress',
      },
    },
  },
}
