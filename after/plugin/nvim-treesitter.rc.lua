local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return vim.notify('COULD NOT LOAD NVIM-TREESITTER', vim.log.levels.ERROR, { title = 'NVIM-TREESITTER' })
end

local ensure_installed = {
  'c',
  'comment',
  'json',
  'jsonc',
  'lua',
  'rust',
  'sql',
  'todotxt',
  'toml',
  'tsx',
  'vim',
  'vimdoc',
  'yaml',
}

configs.setup {
  ensure_installed = ensure_installed,
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}
