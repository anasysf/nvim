local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  return vim.notify('COULD NOT LOAD MASON-LSPCONFIG', vim.log.levels.ERROR, { title = 'MASON-LSPCONFIG' })
end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  return vim.notify('COULD NOT LOAD LSPCONFIG', vim.log.levels.ERROR, { title = 'LSPCONFIG' })
end

local ensure_installed = {
  'clangd',
  'cssls',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'sqls',
  'tailwindcss',
  'tsserver',
  'yamlls',
}

local ignored_servers = { 'tsserver' }

mason_lspconfig.setup {
  ensure_installed = ensure_installed,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      on_attach = require 'octo-wizzro.lsp.utils.on_attach',
      root_dir = function()
        return vim.fn.getcwd()
      end,
    }

    local server_ok, server = pcall(require, 'octo-wizzro.lsp.servers.' .. server_name)
    if server_ok then
      opts = vim.tbl_deep_extend('force', server, opts)
    end

    for _, iserver in pairs(ignored_servers) do
      if server_name == iserver then
        return
      end
    end

    lspconfig[server_name].setup(opts)
  end,
}
