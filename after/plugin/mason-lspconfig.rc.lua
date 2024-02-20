local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return vim.notify('COULD NOT LOAD MASON', vim.log.levels.ERROR, { title = 'MASON' })
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
  return vim.notify(
    'COULD NOT LOAD MASON LSPCONFIG',
    vim.log.levels.ERROR,
    { title = 'MASON LSPCONFIG' }
  )
end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  return vim.notify('COULD NOT LOAD LSPCONFIG', vim.log.levels.ERROR, { title = 'LSPCONFIG' })
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_ok then
  return vim.notify(
    'COULD NOT LOAD CMP NVIM LSP',
    vim.log.levels.ERROR,
    { title = 'CMP NVIM LSP' }
  )
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local ensure_installed = {
  'jsonls',
  'lua_ls',
  'tsserver',
}

local ignored_servers = {
  'tsserver',
}

mason.setup({})

mason_lspconfig.setup({
  ensure_installed = ensure_installed,
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {
      capabilities = capabilities,
      root_dir = function() return vim.fn.getcwd() end,
    }

    local server_ok, server = pcall(require, 'yofs.nvim-lspconfig.servers.' .. server_name)
    if server_ok then opts = vim.tbl_deep_extend('force', server, opts) end

    for _, iserver in pairs(ignored_servers) do
      if server_name == iserver then return end
    end

    lspconfig[server_name].setup(opts)
  end,
})
