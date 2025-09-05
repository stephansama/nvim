local M = {}

local function use_cspell(config_files)
	local cwd = vim.fn.getcwd()

	for _, file in ipairs(config_files) do
		if vim.fn.filereadable(cwd .. "/" .. file) == 1 then
			return true
		end
		if vim.fn.filereadable(cwd .. "/.config/" .. file) == 1 then
			return true
		end
	end

	return false
end

M.cspell_enabled =
	use_cspell({
		".cSpell.json",
		".cspell.json",
		"cSpell.json",
		"cspell.config.cjs",
		"cspell.config.js",
		"cspell.config.json",
		"cspell.config.yaml",
		"cspell.config.yml",
		"cspell.json",
		"cspell.yaml",
		"cspell.yml",
	})

M.lint = function()
	local lint = require("lint")
	lint.try_lint()
	if M.cspell_enabled or _G.cspell_enabled then
		lint.try_lint("cspell")
	end
end

M.create_lint_init = function()
	vim.api.nvim_create_autocmd({ "BufWritePost" }, { callback = M.lint })
end

return M
