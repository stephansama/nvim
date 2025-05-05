local M = {}

M.cspell_enabled = require("utils.pull").use_cspell()

M.lint = function()
	local lint = require("lint")
	lint.try_lint()
	if M.cspell_enabled then
		lint.try_lint("cspell")
	end
end

M.create_lint_init = function()
	vim.api.nvim_create_autocmd({ "BufWritePost" }, { callback = M.lint })
end

M.toggle_cspell = function()
	M.cspell_enabled = not M.cspell_enabled
	if M.cspell_enabled then
		print("linting with cspell")
		M.lint()
	end
end

M.load_linters = function()
	require("lint").linters_by_ft = require("constants.pulled").LINTERS
end

return M
