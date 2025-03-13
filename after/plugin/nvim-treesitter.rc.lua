local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return vim.notify(
		'COULD NOT LOAD NVIM-TREESITTER [CONFIGS]',
		vim.log.levels.ERROR,
		{ title = 'nvim-treesitter [CONFIGS]' }
	)
end

local install_ok, install = pcall(require, 'nvim-treesitter.install')
if not install_ok then
	return vim.notify(
		'COULD NOT LOAD NVIM-TREESITTER [INSTALL]',
		vim.log.levels.ERROR,
		{ title = 'nvim-treesitter [INSTALL]' }
	)
end

install.prefer_git = false

if vim.fn.has 'win32' == 1 then install.compilers = { 'clang', 'zig' } end

local ensure_installed = {
	'comment',
	'dockerfile',
	'gitignore',
	'html',
	'javascript',
	'jsdoc',
	'json',
	'jsonc',
	'lua',
	'luadoc',
	'luap',
	'toml',
	'typescript',
	'vimdoc',
}

configs.setup {
	ensure_installed = ensure_installed,
	sync_install = false,
	auto_install = false,
	highlight = { enable = true },
	indent = { enable = true },
}
