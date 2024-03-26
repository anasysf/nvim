local keymap = vim.keymap

keymap.set('n', '<leader>f', vim.diagnostic.open_float)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end,
})
