local keymap = vim.keymap
local on_attach = function (_, bufnr)
  local buf_set_option = function (name, value)
    vim.api.nvim_set_option_value(name, value, {
      buf = bufnr,
    })
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { buffer = bufnr, noremap = true, silent = true }

  keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  keymap.set('n', '<leader>f', vim.diagnostic.open_float, opts)
  keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

return on_attach
