return {
	'smjonas/inc-rename.nvim',
	opts = {},
	init = function()
		--[[ vim.keymap.set("n", "<leader>rn", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { expr = true }) ]]
	end,
}
