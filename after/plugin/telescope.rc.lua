local builtin_ok, builtin = pcall(require, 'telescope.builtin')
if not builtin_ok then
	return vim.notify(
		'COULD NOT LOAD TELESCOPE [BUILTIN]',
		vim.log.levels.ERROR,
		{ title = 'Telescope [BUILTIN]' }
	)
end

local ok, telescope = pcall(require, 'telescope')
if not ok then
	return vim.notify('COULD NOT LOAD TELESCOPE', vim.log.levels.ERROR, { title = 'Telescope' })
end

telescope.setup {
	buffers = { path_display = { 'truncate' } },
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
		},
	},
}

local keymap = vim.keymap
local opts = { silent = true }

keymap.set('n', '<leader>ff', builtin.find_files, opts)
keymap.set('n', '<leader>fg', builtin.live_grep, opts)
keymap.set('n', '<leader>fb', builtin.buffers, opts)
keymap.set('n', '<leader>fh', builtin.help_tags, opts)
keymap.set('n', '<leader>th', builtin.colorscheme, opts)
keymap.set('n', '<leader>fv', builtin.git_files, opts)

telescope.load_extension 'fzf'
