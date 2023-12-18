local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return vim.notify(
    'COULD NOT LOAD TREESITTER [CONFIGS]',
    vim.log.levels.ERROR,
    { title = 'TREESITTER [CONFIGS]' }
  )
end

local ensure_installed = {
  'css',
  'html',
  'javascript',
  'json',
  'jsonc',
  'lua',
  'toml',
  'typescript',
  'vim',
  'vimdoc',
}

configs.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = ensure_installed,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}
