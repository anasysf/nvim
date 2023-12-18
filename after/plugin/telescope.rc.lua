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

local actions_ok, actions = pcall(require, 'telescope.actions')
if not actions_ok then
  return vim.notify(
    'COULD NOT LOAD TELESCOPE [ACTIONS]',
    vim.log.levels.ERROR,
    { title = 'TELESCOPE [ACTIONS]' }
  )
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-u>'] = false,
      },
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
    },
    live_grep = {
      theme = 'dropdown',
    },
    buffers = {
      theme = 'dropdown',
      mappings = {
        i = {
          ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
        },
      },
    },
    help_tags = {
      theme = 'dropdown',
    },
  },
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
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>ff', builtin.find_files, opts)
keymap.set('n', '<leader>fp', function()
  builtin.find_files { hidden = true }
end, opts)
keymap.set('n', '<leader>fg', builtin.live_grep, opts)
keymap.set('n', '<leader>fb', builtin.buffers, opts)
keymap.set('n', '<leader>fh', builtin.help_tags, opts)
