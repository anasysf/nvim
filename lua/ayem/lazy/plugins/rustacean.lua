return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    local function on_attach(_, bufnr)
      local keymap = vim.keymap
      local cmd = vim.cmd

      local nnoremap = function(keys, fn, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        keymap.set('n', keys, fn, { buffer = bufnr, noremap = true, desc = desc })
      end

      nnoremap('<leader>ca', function()
        cmd.RustLsp 'codeAction'
      end)
      nnoremap('K', function()
        cmd.RustLsp { 'hover', 'actions' }
      end)
      nnoremap('<leader>dm', function()
        cmd.RustLsp { 'renderDiagnostic', 'current' }
      end)
      nnoremap('gd', vim.lsp.buf.definition, '[G]oto [d]efinition')
      nnoremap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    end

    vim.g.rustaceanvim = {
      server = {
        on_attach = on_attach,
      },
    }
  end,
}
