function On_Attach(_, bufnr)
  local keymap = vim.keymap

  local nnoremap = function(keys, fn, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    keymap.set('n', keys, fn, { buffer = bufnr, noremap = true, desc = desc })
  end

  nnoremap('<leader>dm', vim.diagnostic.open_float, 'Open floating diagnostic message')
  nnoremap('gp', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
  nnoremap('gn', vim.diagnostic.goto_next, 'Go to next diagnostic message')
  nnoremap('<leader>dl', vim.diagnostic.setloclist, 'Open [d]iagnostics [l]ist')

  nnoremap('gd', vim.lsp.buf.definition, '[G]oto [d]efinition')
  nnoremap('K', vim.lsp.buf.hover, 'Hover documentation')
  nnoremap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  keymap.set(
    { 'n', 'v' },
    '<leader>ca',
    vim.lsp.buf.code_action,
    { buffer = bufnr, noremap = true, desc = 'LSP:  [C]ode [A]ction' }
  )
end

return On_Attach
