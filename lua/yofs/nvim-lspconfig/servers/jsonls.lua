local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local schemas = {
  {
    description = "JSON schema for the TypeScript compiler's configuration file",
    fileMatch = { 'tsconfig.json', 'jsconfig.json', 'tsconfig.*.json', 'jsconfig.*.json' },
    url = 'https://json.schemastore.org/tsconfig',
  },
  {
    description = 'JSON schema for NPM package.json files',
    fileMatch = { 'package.json' },
    url = 'https://json.schemastore.org/package',
  },
  {
    description = 'JSON schema for ESLint configuration files',
    fileMatch = { '.eslintrc.json', '.eslintrc' },
    url = 'https://json.schemastore.org/eslintrc',
  },
  {
    description = 'JSON schema for ESLint configuration files',
    fileMatch = { '.prettierrc', '.prettierrc.json', 'prettier.config.json' },
    url = 'https://json.schemastore.org/prettierrc',
  },
}

return {
  capabilities = capabilities,
  settings = {
    json = {
      validate = {
        enable = true,
      },
      schemas = schemas,
    },
  },
}
