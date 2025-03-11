local lazy_boot_ok, lazy_boot = pcall(require, 'ayem.lazy.bootstrap')
if not lazy_boot_ok then
	return vim.notify(
		'COULD NOT LOAD LAZY [BOOTSTRAP]',
		vim.log.levels.ERROR,
		{ title = 'Lazy [BOOTSTRAP]' }
	)
end

local ok, lazy = pcall(require, 'lazy')
if not lazy_boot_ok then
	return vim.notify('COULD NOT LOAD LAZY', vim.log.levels.ERROR, { title = 'Lazy' })
end

lazy.setup {
	spec = {
		{ import = 'ayem.lazy.plugins' },
	},
	install = { colorscheme = { 'retrobox' } },
	checker = { enable = true },
}
