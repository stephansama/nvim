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

return M
