if not vim.tbl_contains(require("lang.enabled").enabled, "ai") then return end

vim.pack.add({
	{ src = "https://github.com/github/copilot.vim" },
	{ src = "https://github.com/folke/sidekick.nvim" },
})

vim.g.copilot_no_maps = true

-- Block the normal Copilot suggestions
-- vim.api.nvim_create_augroup("github_copilot", { clear = true })
-- vim.api.nvim_create_autocmd(
-- 	{ "FileType", "BufUnload" },
-- 	{
-- 		group = "github_copilot",
-- 		callback = function(args)
-- 			vim.fn["copilot#On" .. args.event]()
-- 		end,
-- 	}
-- )
vim.fn["copilot#OnFileType"]()

require("sidekick").setup({
	cli = {
		mux = {
			backend = "tmux",
			enabled = true,
		},
	},
})
