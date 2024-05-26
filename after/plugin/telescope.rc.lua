local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
  return vim.notify('COULD NOT LOAD TELESCOPE', vim.log.levels.ERROR, { title = 'TELESCOPE' })
end

local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  return vim.notify('COULD NOT LOAD TELESCOPE', vim.log.levels.ERROR, { title = 'TELESCOPE' })
end

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
    },
  },
}

telescope.load_extension 'fzf'

local keymap = vim.keymap

keymap.set('n', '<leader>ff', builtin.find_files)
keymap.set('n', '<leader>fg', builtin.live_grep)
keymap.set('n', '<leader>fb', builtin.buffers)
keymap.set('n', '<leader>fh', builtin.help_tags)
