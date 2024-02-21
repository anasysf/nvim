local ok, telescope = pcall(require, 'telescope')
if not ok then
  return vim.notify('COULD NOT LOAD TELESCOPE', vim.log.levels.ERROR, { title = 'TELESCOPE' })
end

local builtin_ok, builtin = pcall(require, 'telescope.builtin')
if not builtin_ok then
  return vim.notify(
    'COULD NOT LOAD TELESCOPE [BUILTIN]',
    vim.log.levels.ERROR,
    { title = 'TELESCOPE [BUILTIN]' }
  )
end

telescope.setup({
  pickers = {
    find_files = {
      theme = 'dropdown',
      prompt_prefix = '🔎 ',
    },
    live_grep = {
      theme = 'dropdown',
      prompt_prefix = '🔭 ',
    },
  },
})

telescope.load_extension 'fzf'

local keymap = vim.keymap
local opts = { noremap = false, silent = true }

keymap.set('n', '<leader>ff', builtin.find_files, opts)
keymap.set('n', '<leader>fg', builtin.live_grep, opts)
keymap.set('n', '<leader>fh', builtin.colorscheme, opts)
