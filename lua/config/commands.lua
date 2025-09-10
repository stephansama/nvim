--- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--- underline found links
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("HighlightLinks", { clear = true }),
	pattern = "*",
	command = [[match Underlined /https\?:\/\/\S\+/]],
})

--- reset specific highlight groups when changing color schemes
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335" })
		vim.api.nvim_set_hl(0, "FloatBorder", {
			fg = "white",
			bg = "#1f2335",
		})
	end,
})

local function reset_ui()
	if package.preload["ufo"] then
		vim.cmd([[UfoEnableFold]])
	end

	vim.api.nvim_set_hl(0, "FloatBorder", {
		fg = "White",
		bg = "none",
	})

	vim.api.nvim_set_hl(0, "LspInlayHint", {
		fg = "#646464",
		bg = "none",
	})

	vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
		fg = "#C93638",
		bg = "none",
	})

	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", {
		fg = "#C93638",
		bg = "none",
	})

	if package.preload["dashboard"] then
		vim.cmd([[ColorDashboard]])
	end
end

vim.api.nvim_create_user_command("ResetUI", reset_ui, { nargs = 0 })
