local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
	return vim.notify('COULD NOT LOAD LSPCONFIG', vim.log.levels.ERROR, { title = 'LSPconfig' })
end

local mason_lsp_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then
	return vim.notify(
		'COULD NOT LOAD MASON-LSPCONFIG',
		vim.log.levels.ERROR,
		{ title = 'Mason-LSPconfig' }
	)
end

local on_attach_ok, on_attach = pcall(require, 'ayem.nvim-lspconfig.utils.on_attach')
if not on_attach_ok then
	return vim.notify('COULD NOT LOAD ON ATTACH', vim.log.levels.ERROR, { title = 'ON ATTACH' })
end

local server_opts = { on_attach = on_attach }
local handlers = {
	function(server_name)
		local server_ok, server = pcall(require, 'ayem.nvim-lspconfig.servers.' .. server_name)
		if server_ok then server_opts = vim.tbl_deep_extend('force', server, server_opts) end

		lspconfig[server_name].setup(server_opts)
	end,
}

local ensure_installed = { 'lua_ls', 'ts_ls' }
mason_lspconfig.setup {
	ensure_installed = ensure_installed,
	handlers = handlers,
}
