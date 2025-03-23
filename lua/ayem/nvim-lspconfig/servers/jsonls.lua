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
}

return {
	settings = {
		json = {
			schemas = schemas,
			validate = { enable = true },
		},
	},
}
