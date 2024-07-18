--Enable (broadcasting) snippet capability for completion

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local schemas = {
  {
    url = 'https://json.schemastore.org/package',
    fileMatch = { 'package.json' },
  },
  {
    url = 'https://json.schemastore.org/tsconfig',
    fileMatch = {
      'tsconfig.json',
      'tsconfig.*.json',
      'jsconfig.json',
      'jsconfig.*.json',
    },
  },
  {
    url = 'https://json.schemastore.org/prettierrc',
    fileMatch = { '.prettierrc', '.prettierrc.json' },
  },
}

return {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = schemas,
      validate = { enable = true },
    },
  },
}
