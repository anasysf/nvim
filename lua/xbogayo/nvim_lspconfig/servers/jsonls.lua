local schemas = {
  {
    description = "JSON schema for the TypeScript compiler's configuration file",
    fileMatch = {
      'tsconfig.*.json',
      'tsconfig.json',
    },
    url = 'https://json.schemastore.org/tsconfig.json',
  },
  {
    description = 'JSON schema for Babel 6+ configuration files',
    fileMatch = {
      '.babelrc',
      '.babelrc.json',
      'babel.config.json',
    },
    url = 'https://json.schemastore.org/babelrc.json',
  },
  {
    description = 'JSON schema for ESLint configuration files',
    fileMatch = {
      '.eslintrc',
      '.eslintrc.json',
    },
    url = 'https://json.schemastore.org/eslintrc.json',
  },
  {
    description = 'Schema for .prettierrc',
    fileMatch = {
      '.prettierrc',
      '.prettierrc.json',
      'prettier.config.json',
    },
    url = 'https://json.schemastore.org/prettierrc',
  },
  {
    description = 'JSON schema for NPM package.json files',
    fileMatch = {
      'package.json',
    },
    url = 'https://json.schemastore.org/package.json',
  },
  {
    description = 'JSON Schema for typedoc.json',
    fileMatch = {
      'typedoc.json',
      'typedoc.jsonc',
    },
    url = 'https://typedoc.org/schema.json',
  },
}

return {
  settings = {
    json = {
      schemas = schemas,
      validate = {
        enable = true,
      },
    },
  },
}
