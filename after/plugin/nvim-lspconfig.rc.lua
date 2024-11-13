local ok, lsp = pcall(require, 'lspconfig')
if not ok then
  return vim.notify('COULD NOT LOAD LSPCONFIG', vim.log.levels.ERROR, { title = 'LSPCONFIG' })
end

local cmp_lsp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_lsp_ok then
  return vim.notify('COULD NOT LOAD CMP_NVIM_LSP', vim.log.levels.ERROR, { title = 'CMP_NVIM_LSP' })
end

local mlsp_ok, mlsp = pcall(require, 'mason-lspconfig')
if not mlsp_ok then
  return vim.notify('COULD NOT LOAD MASON-LSPCONFIG', vim.log.levels.ERROR, { title = 'MASON-LSPCONFIG' })
end

local capabilities = cmp_lsp.default_capabilities()

---@type string[]
local ensure_installed = {
  'intelephense',
  'lua_ls',
  'rust_analyzer',
  'ts_ls',
  'twiggy_language_server',
  'taplo',
  -- 'phpactor',
}

---@type string[]
local ignored_servers = {
  'rust_analyzer',
  'ts_ls',
}

mlsp.setup {
  ensure_installed = ensure_installed,
}

local on_attach = require 'ayem.lspconfig.utils.on_attach'
local function setup()
  local server_opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  for _, server in pairs(ensure_installed) do
    for _, ignored_server in pairs(ignored_servers) do
      if ignored_server == server then
        return
      end
    end

    local server_ok, server_name = pcall(require, 'ayem.lspconfig.servers.' .. server)
    if server_ok then
      server_opts = vim.tbl_deep_extend('force', server_name, server_opts)
    end

    lsp[server].setup(server_opts)
  end
end

mlsp.setup_handlers { setup }
