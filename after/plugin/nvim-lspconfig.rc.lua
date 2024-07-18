local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  return vim.notify('COULD NOT LOAD MASON-LSPCONFIG', vim.log.levels.ERROR, { title = 'MASON-LSPCONFIG' })
end

local lspconf_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconf_ok then
  return vim.notify('COULD NOT LOAD LSPCONFIG', vim.log.levels.ERROR, { title = 'LSPCONFIG' })
end

local ensure_installed = {
  'lua_ls'
}

local ignored_servers = {}

lspconfig.util.default_config = vim.tbl_extend(
  'force',
  lspconfig.util.default_config,
  {
    capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      -- returns configured operations if setup() was already called

      -- or default operations if not
      require'lsp-file-operations'.default_capabilities()
    )
  }
)

mason_lspconfig.setup {
  ensure_installed = ensure_installed,
}

mason_lspconfig.setup_handlers {
  function (server_name)
    local opts = {
      on_attach = require 'yofs.lsp.utils.on_attach',
      root_dir = function ()
        return vim.fn.getcwd()
      end,
    }

    local server_ok, server = pcall(require, 'yofs.lsp.servers.' .. server_name)
    if server_ok then
      opts = vim.tbl_deep_extend('force', server, opts)
    end

    for _, iserver in pairs(ignored_servers) do
      if server_name == iserver then
        return
      end
    end

    lspconfig[server_name].setup(opts)
  end
}
