local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return vim.notify('COULD NOT LOAD TREESITTER [CONFIGS]', vim.log.levels.ERROR, { title = 'TREESITTER [CONFIGS]' })
end

local ensure_installed = {
  'lua',
  'vimdoc',
}

configs.setup {
  ensure_installed = ensure_installed,
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}
