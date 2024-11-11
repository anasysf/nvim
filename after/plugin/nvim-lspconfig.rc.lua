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

-- @type string[]
local ensure_installed = {
  'lua_ls',
  -- 'phpactor',
  'intelephense',
}

-- @type string[]
local ignored_servers = {}

mlsp.setup {
  ensure_installed = ensure_installed,
}

local keymap = vim.keymap

local on_attach = function(_, bufnr)
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

local function setup()
  local server_opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  for _, server in pairs(ensure_installed) do
    if ignored_servers[server] then
      return
    end

    local server_ok, server_name = pcall(require, 'ayem.lspconfig.servers.' .. server)
    if server_ok then
      server_opts = vim.tbl_deep_extend('force', server_name, server_opts)
    end

    lsp[server].setup(server_opts)
  end
end

mlsp.setup_handlers { setup }
