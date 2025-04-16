local on_attach = function(_, bufnr)
	local keymap = vim.keymap
	local opts = { silent = true, buffer = bufnr }

	vim.diagnostic.enable(false)
	local toggle_diagnostics = function()
		return vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	end

	keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	keymap.set('n', '<leader>d', toggle_diagnostics, opts)
end

return on_attach
