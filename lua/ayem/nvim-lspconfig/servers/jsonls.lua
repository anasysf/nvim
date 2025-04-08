local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local schemas = {
	{
		url = 'https://json.schemastore.org/tsconfig',
		fileMatch = { 'tsconfig.json', 'jsconfig.json', 'tsconfig.*.json', 'jsconfig.*.json' },
		description = "JSON schema for the TypeScript compiler's configuration file",
	},
	{
		url = 'https://json.schemastore.org/package.json',
		fileMatch = { 'package.json' },
		description = 'JSON schema for NPM package.json files',
	},
	{
		url = 'https://json.schemastore.org/prettierrc.json',
		fileMatch = { '.prettierrc', '.prettierrc.json' },
		description = 'Schema for .prettierrc',
	},
	{
		url = 'https://json.schemastore.org/babelrc.json',
		fileMatch = { '.babelrc.json', 'babel.config.json' },
		description = 'JSON schema for Babel 6+ configuration files',
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
