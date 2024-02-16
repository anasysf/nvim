local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return vim.notify(
    'COULD NOT LOAD TREESITTER [CONFIGS]',
    vim.log.levels.ERROR,
    { title = 'TREESITTER [CONFIGS]' }
  )
end

local ensure_installed = {
  'gitignore',
  'html',
  'javascript',
  'jsdoc',
  'lua',
  'luadoc',
  'toml',
  'typescript',
  'vim',
  'vimdoc',
}

configs.setup({
  ensure_installed = ensure_installed,
  sync_install = false,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local stats_ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if stats_ok and stats and stats.size > max_filesize then return true end
    end,
  },
  indent = {
    enable = true,
  },
})
