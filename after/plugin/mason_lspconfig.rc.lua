local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  return vim.notify(
    'COULD NOT LOAD MASON-LSPCONFIG',
    vim.log.levels.ERROR,
    { title = 'MASON-LSPCONFIG' }
  )
end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  return vim.notify(
    'COULD NOT LOAD LSPCONFIG (MASON-LSPCONFIG)',
    vim.log.levels.ERROR,
    { title = 'LSPCONFIG (MASON-LSPCONFIG)' }
  )
end

local ensure_installed = {
  'cssls',
  'html',
  'jsonls',
  'lua_ls',
  'tsserver',
}

local ignored_servers = {
  'tsserver',
}

mason_lspconfig.setup {
  ensure_installed = ensure_installed,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      -- capabilities = capabilities,
      root_dir = function()
        return vim.fn.getcwd()
      end,
    }

    local server_ok, server = pcall(require, 'xbogayo.nvim_lspconfig.servers.' .. server_name)
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
