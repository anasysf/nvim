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

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_ok then
	return vim.notify(
		'COULD NOT LOAD CMP_NVIM_LSP',
		vim.log.levels.ERROR,
		{ title = 'CMP_NVIM_LSP' }
	)
end

local ensure_installed = {
	'css_variables',
	'cssls',
	'cssmodules_ls',
	'intelephense',
	'jdtls',
	'jsonls',
	'lua_ls',
	'tailwindcss',
	'ts_ls',
}

local ignored_servers = { 'jdtls' }

local capabilities = cmp_nvim_lsp.default_capabilities()
local server_opts = {
	on_attach = on_attach,
	capabilities = capabilities,
}
local handlers = {
	function(server_name)
		for _, value in ipairs(ignored_servers) do
			if server_name == value then return end
		end

		local server_ok, server = pcall(require, 'ayem.nvim-lspconfig.servers.' .. server_name)
		if server_ok then server_opts = vim.tbl_deep_extend('force', server, server_opts) end

		return lspconfig[server_name].setup(server_opts)
	end,
}

mason_lspconfig.setup {
	ensure_installed = ensure_installed,
	handlers = handlers,
}
