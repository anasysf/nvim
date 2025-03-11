local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return vim.notify(
		'COULD NOT LOAD NVIM-TREESITTER [CONFIGS]',
		vim.log.levels.ERROR,
		{ title = 'nvim-treesitter [CONFIGS]' }
	)
end

local ensure_installed = {
	'comment',
	'gitignore',
	'json',
	'jsonc',
	'lua',
	'luadoc',
	'luap',
	'toml',
	'vimdoc',
}

configs.setup {
	ensure_installed = ensure_installed,
	sync_install = false,
	auto_install = false,
	highlight = { enable = true },
	indent = { enable = true },
}
