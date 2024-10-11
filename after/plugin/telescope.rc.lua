local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
  return vim.notify('COULD NOT LOAD TELESCOPE [BUILTIN]', vim.log.levels.ERROR, { title = 'TELESCOPE [BUILTIN]' })
end

local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  return vim.notify('COULD NOT LOAD TELESCOPE', vim.log.levels.ERROR, { title = 'TELESCOPE' })
end

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

telescope.load_extension 'fzf'

local keymap = vim.keymap

keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
