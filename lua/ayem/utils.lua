local M = {}

function M.is_win32() return vim.fn.has 'win32' end

return M
