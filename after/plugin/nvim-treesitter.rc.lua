local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return vim.notify(
    'COULD NOT LOAD NVIM-TREESITTER [CONFIGS]',
    vim.log.levels.ERROR,
    { title = 'NVIM-TREESITTER [CONFIGS]' }
  )
end

local ensure_installed = {
  'bash',
  'comment',
  'css',
  'editorconfig',
  'gitcommit',
  'gitignore',
  'html',
  'ini',
  'java',
  'javascript',
  'jsdoc',
  'json',
  'jsonc',
  'lua',
  'luadoc',
  'luap',
  'markdown',
  'markdown_inline',
  'php',
  'phpdoc',
  'properties',
  'tmux',
  'twig',
  'vim',
  'vimdoc',
  'xml',
}

configs.setup {
  ensure_installed = ensure_installed,
  auto_install = false,
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}
