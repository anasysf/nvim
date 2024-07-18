return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  opts = {
    on_attach = require 'yofs.lsp.utils.on_attach',
  },
}
